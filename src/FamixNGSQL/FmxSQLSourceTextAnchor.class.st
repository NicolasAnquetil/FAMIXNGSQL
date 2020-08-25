Class {
	#name : #FmxSQLSourceTextAnchor,
	#superclass : #FmxSQLSourceAnchor,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSourceTextAnchor class >> annotation [

	<MSEClass: #SourceTextAnchor super: #FmxSQLSourceAnchor>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLSourceTextAnchor >> end [
	^source size
]

{ #category : #accessing }
FmxSQLSourceTextAnchor >> start [
	^1
]
