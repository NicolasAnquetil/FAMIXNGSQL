Extension { #name : #SqlPrimaryKeyConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlPrimaryKeyConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	<DBETODO>
	| constraint |
	constraint := FmxSQLPrimaryKeyConstraint new
			name: self name;
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
			mooseModel: aMooseModel;
			yourself.
	self constrainedColumns
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			FmxSQLColumnReference new
						source: constraint;
						column: fmxColumn;
						isWildCardReference: false;
						isCertain: true;
						mooseModel: aMooseModel ;
						yourself ].
	^ constraint
]
