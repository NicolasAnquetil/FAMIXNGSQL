"
I am a reference to a table.
"
Class {
	#name : #FmxSQLTableReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#source => FMOne type: #FmxSQLTWithTableReference opposite: #outgoingTableReferences',
		'#table => FMOne type: #FmxSQLTable opposite: #references'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTableReference class >> annotation [

	<MSEClass: #TableReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLTableReference >> isTableReference [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLTableReference >> source [
	"Relation named: #source type: #FmxSQLTWithTableReference opposite: #outgoingTableReferences"

	<generated>
	<source>
	^ source
]

{ #category : #accessing }
FmxSQLTableReference >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FmxSQLTableReference >> sourcedBelonger [ 
	^self source sourcedBelonger
]

{ #category : #accessing }
FmxSQLTableReference >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #references"

	<generated>
	<target>
	^ table
]

{ #category : #accessing }
FmxSQLTableReference >> table: anObject [

	<generated>
	table := anObject

]
