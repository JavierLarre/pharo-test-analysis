"
I detect whether tests do not contain assertions
"
Class {
	#name : 'TSDAssertionLessDetector',
	#superclass : 'TSDDetector',
	#instVars : [
		'methodVisitor'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'private' }
TSDAssertionLessDetector >> analyzeMethod [

	self methodVisitor analyzeMethod: self compiledMethod 
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> compiledMethod [

	^ self selfClass lookupSelector: self selector
]

{ #category : 'testing' }
TSDAssertionLessDetector >> detects [
	^ self isAssertionLess 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNoAssertionSelectors [

	^ self methodVisitor helperSelectors allSatisfy: [ :aHelperSelector | 
				(self methodVisitor messages does: self compiledMethod includesMessage: aHelperSelector) not ]
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNohelpers [

	^ (self methodVisitor helpers at: self compiledMethod) isEmpty 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> isAssertionLess [

	self analyzeMethod .
	^ self hasNoAssertionSelectors and: [ self hasNohelpers ]
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := RTDHelperVisitor new ]
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor: anObject [

	methodVisitor := anObject
]
