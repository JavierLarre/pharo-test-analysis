Class {
	#name : 'TSDAssertionLessResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'isAssertionLess'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDAssertionLessResult >> asResultForDrTest [

	| node |
	node := super asResultForDrTest.
	node name: (String streamContents: [ :stream | 
		stream << node name; << ': '; << (self isAssertionLess ifTrue: [ 'is assertionless' ] ifFalse: [ 'has assertions' ]) ]) .
	^ node
]

{ #category : 'accessing' }
TSDAssertionLessResult >> isAssertionLess [

	^ isAssertionLess
]

{ #category : 'accessing' }
TSDAssertionLessResult >> isAssertionLess: anObject [

	isAssertionLess := anObject
]
