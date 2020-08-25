Extension { #name : #FmxSQLReference }

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
FmxSQLReference >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Source code';
		display: [ self sourceAnchorIfNone: [ nil ] ];
		format: [ :t | 
			[ self sourceAnchor
				ifNil: [ FmxSQLNoSourceAnchor signal ]
				ifNotNil: [ self sourceAnchor entity sourceCodeAsText ] ]
			on: Error
			do: [ 'No source anchor' asText ] ];
		withLineNumbers: true;
		initialize: [ :presentation | 
			[ self sourceAnchor in: [ :anchor |
				anchor
					ifNil: [ FmxSQLNoSourceAnchor signal ]
				 	ifNotNil: [ presentation selectionInterval: (anchor start to: anchor end)] ]
			 ] on: FmxSQLNoSourceAnchor do: [ "Nothing on purpose" ] ];
		yourself
]
