visiting
visitPSQLASTAttributeAccess: aPSQLASTAttributeAccess
	| identifiers |
	identifiers := nil.
	self
		visit: aPSQLASTAttributeAccess attributeIdentifier
		thenDo: [ :identifier | identifiers := SRIdentifierWithNode identifier: identifier node: aPSQLASTAttributeAccess attributeIdentifier next: identifiers ].
	self
		visit: aPSQLASTAttributeAccess accessed
		thenDo: [ :identifier | identifiers := SRIdentifierWithNode identifier: identifier node: aPSQLASTAttributeAccess accessed next: identifiers ].

	"We check that the identifier should be ignored (for example true or false)"
	(self shouldRejectIdentifiers: identifiers)
		ifTrue: [ ^ nil ]. self flag: #TODO. "Nil should never be returned..."
	
	((self isNewOrOldIdentifier: identifiers) and: [ self function class = FmxSQLTriggerStoredProcedure ])
		ifTrue: [ self ensureNewOrOldLocalVariableWellSetFor: identifiers ].
	
	[ self resolveAndLink: identifiers ]
		on: SRReferencesInconsistencies , SRReferencesNotFound
		do: [ :anError | 
			"new and old are implicit declared variables in stored procedures"
			(self isImplicitVariable: identifiers identifier)
				ifTrue: [ 
					FmxSQLLocalVariable new
						name: identifiers identifier;
						storedProcedure: self function;
						mooseModel: self model.
					self resolveAndLinkSilently: identifiers ]
				ifFalse: [ self errorReport addError: anError ] ].
	^ identifiers targetEntity