Extension { #name : #SqlUniqueConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlUniqueConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	<DBETODO>
	| constraint |
	constraint := FmxSQLUniqueConstraint new
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
				mooseModel: aMooseModel;
				yourself ].
	^ constraint
]
