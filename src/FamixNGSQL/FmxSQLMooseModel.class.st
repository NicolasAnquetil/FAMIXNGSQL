Class {
	#name : #FmxSQLMooseModel,
	#superclass : #MooseModel,
	#category : #FamixNGSQL
}

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getColumn: columnName fromTable: tableName [
	^ self detect: [ :e |
		e class = FmxSQLColumn and:
		[ (e name = columnName) and: 
		[ e columnsContainer name = tableName ] ]
		]
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getConstraint: constraintName fromTable: tableName [
	^ self detect: [ :e |
		(e isKindOf: FmxSQLConstraint) and: 
			[ (e name = constraintName) and: 
			 [ e table name = tableName ] ]
		]
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getEntityNamed: aName ofType: aClass [
	^self detect: [ :e |
		e class = aClass and: [ e name = aName ]
	]
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getSchema: aName [
	^ self getEntityNamed: aName ofType: FmxSQLNamespace
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getStoredProcedure: aName [
	^ self getEntityNamed: aName ofType: FmxSQLStoredProcedure
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getTable: aName [
	^self getEntityNamed: aName ofType: FmxSQLTable
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getTrigger: aName [
	^ self getEntityNamed: aName ofType: FmxSQLTrigger
]

{ #category : #'accessing - private' }
FmxSQLMooseModel >> getView: aName [
		^ self getEntityNamed: aName ofType: FmxSQLView
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
