Extension { #name : #SqlForeignKeyConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlForeignKeyConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	<DBETODO>
	| constraint ref |
	constraint := FmxSQLForeignKeyConstraint new
			name: self name;
			table: (pgToFamixEntities at: self constrainedColumns anyOne) columnsContainer;
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
			self flag: 'setting source anchor should probably be done somewhere else'.
			ref sourceAnchor: (FmxSQLSourceTextAnchor new element: ref ; source: '' ; yourself) ].
	self referencedObjects
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			ref := FmxSQLColumnReference new
						foreignKeyConstraintSource: constraint;
						column: fmxColumn;
						isWildCardReference: false;
						isCertain: true;
						mooseModel: aMooseModel;
						yourself.
			self flag: 'setting source anchor should probably be done somewhere else'.
			ref sourceAnchor: (FmxSQLSourceTextAnchor new element: ref ; source: '' ; yourself) ].
				
	constraint mooseModel: aMooseModel.
	^ constraint
]
