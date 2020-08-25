Extension { #name : #SqlPrimaryKeyConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlPrimaryKeyConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	<DBETODO>
	| constraint ref |
	constraint := FmxSQLPrimaryKeyConstraint new
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
						mooseModel: aMooseModel ;
						yourself.
			self flag: 'setting source anchor should probably be done somewhere else'.
			ref sourceAnchor: (FmxSQLSourceTextAnchor new element: ref ; source: '' ; yourself) ].
	^ constraint
]
