"
I am a DTO that contains the result of a detection
"
Class {
	#name : 'TSDResult',
	#superclass : 'Object',
	#instVars : [
		'analyzedClass',
		'selector'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'accessing' }
TSDResult >> analyzedClass [

	^ analyzedClass
]

{ #category : 'accessing' }
TSDResult >> analyzedClass: anObject [

	analyzedClass := anObject
]

{ #category : 'accessing' }
TSDResult >> selector [

	^ selector
]

{ #category : 'accessing' }
TSDResult >> selector: anObject [

	selector := anObject
]
