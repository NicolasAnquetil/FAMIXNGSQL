Class {
	#name : #FmxSQLMooseModel,
	#superclass : #MooseModel,
	#category : #FamixNGSQL
}

{ #category : #'as yet unclassified' }
FmxSQLMooseModel >> getColumn: columnName fromTable: tableName [
	^ self detect: [ :e |
		e class = FmxSQLColumn and:
		[ (e name = columnName) and: 
		[ e columnsContainer name = tableName ] ]
		]
]

{ #category : #'as yet unclassified' }
FmxSQLMooseModel >> getConstraint: constraintName fromTable: tableName [
	^ self detect: [ :e |
		(e isKindOf: FmxSQLConstraint) and: 
			[ (e name = constraintName) and: 
			 [ e table name = tableName ] ]
		]
]

{ #category : #'as yet unclassified' }
FmxSQLMooseModel >> getSchema: schemaName [
	^ self detect: [ :e |
		e class = FmxSQLNamespace and: [ e name = schemaName ]
	]
]

{ #category : #'as yet unclassified' }
FmxSQLMooseModel >> getTable: tableName [
	^ self detect: [ :e |
		e class = FmxSQLTable and: [ e name = tableName ]
	]
]

{ #category : #'as yet unclassified' }
FmxSQLMooseModel >> gtEntitiesIn: composite [
	"To not show all entities in model inspector"
]

{ #category : #initialization }
FmxSQLMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FmxSQLMetamodelGenerator) metamodel
]
