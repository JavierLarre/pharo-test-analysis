"
I am a DTO that contains the result of a detection
"
Class {
	#name : 'TSDSmellResult',
	#superclass : 'Object',
	#instVars : [
		'testClass',
		'selector'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'accessing' }
TSDSmellResult >> selector [

	^ selector
]

{ #category : 'accessing' }
TSDSmellResult >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> testClass [

	^ testClass 
]

{ #category : 'accessing' }
TSDSmellResult >> testClass: anObject [

	testClass := anObject
]
