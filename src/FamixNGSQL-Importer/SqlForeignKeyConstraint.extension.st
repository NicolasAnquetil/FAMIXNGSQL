Extension { #name : #SqlForeignKeyConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlForeignKeyConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	<DBETODO>
	| constraint |
	constraint := FmxSQLForeignKeyConstraint new
			name: self name;
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
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
	self referencedObjects
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			FmxSQLColumnReference new
						foreignKeyConstraintSource: constraint;
						column: fmxColumn;
						isWildCardReference: false;
						isCertain: true;
						mooseModel: aMooseModel;
						yourself ].
				
	constraint mooseModel: aMooseModel.
	^ constraint
]
