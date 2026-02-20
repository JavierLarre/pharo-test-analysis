"
I am a DTO that contains the result of a detection
"
Class {
	#name : 'TSDResult',
	#superclass : 'Object',
	#instVars : [
		'testClass',
		'selector',
		'overwrittenVariables'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'accessing' }
TSDResult >> overwrittenVariables [

	^ overwrittenVariables
]

{ #category : 'accessing' }
TSDResult >> overwrittenVariables: anObject [

	overwrittenVariables := anObject
]

{ #category : 'accessing' }
TSDResult >> selector [

	^ selector
]

{ #category : 'accessing' }
TSDResult >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
TSDResult >> testClass [

	^ testClass 
]

{ #category : 'accessing' }
TSDResult >> testClass: anObject [

	testClass := anObject
]
