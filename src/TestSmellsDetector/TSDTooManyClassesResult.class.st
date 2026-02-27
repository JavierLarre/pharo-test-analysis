Class {
	#name : 'TSDTooManyClassesResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'detectedClasses',
		'doesReferenceManyClasses'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDTooManyClassesResult >> asResultForDrTest [

	| node |
	node := super asResultForDrTest.
	node subResults addAll: { 
		DTTreeNode name: 'Detected classes' subResults: (DTRTDMessageNode toNodes: self detectedClasses ).
		DTRTDMessageNode new message: ('References too many classes: ', self doesReferenceManyClasses printString); yourself 
	 } .
	^ node
]

{ #category : 'accessing' }
TSDTooManyClassesResult >> detectedClasses [

	^ detectedClasses
]

{ #category : 'accessing' }
TSDTooManyClassesResult >> detectedClasses: anObject [

	detectedClasses := anObject
]

{ #category : 'accessing' }
TSDTooManyClassesResult >> doesReferenceManyClasses [

	^ doesReferenceManyClasses
]

{ #category : 'accessing' }
TSDTooManyClassesResult >> doesReferenceManyClasses: anObject [

	doesReferenceManyClasses := anObject
]
