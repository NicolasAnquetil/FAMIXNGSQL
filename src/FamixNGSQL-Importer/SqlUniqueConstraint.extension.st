Extension { #name : #SqlUniqueConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlUniqueConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	<DBETODO>
	| constraint ref |
	constraint := FmxSQLUniqueConstraint new
			name: self name;
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			mooseModel: aMooseModel;
			yourself.
	self constrainedColumns
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			ref := FmxSQLColumnReference new
				source: constraint;
				column: fmxColumn;
				isWildCardReference: false;
				isCertain: true;
				mooseModel: aMooseModel;
				yourself.
				self flag: 'Should probably be somewhere else, where all source anchors are set'.
				ref 
					sourceAnchor: (FmxSQLSourceTextAnchor new source: '' ; element: ref ; yourself) ].
	^ constraint
]
