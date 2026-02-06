"
I detect whether tests do not contain assertions
"
Class {
	#name : 'TSDAssertionLessDetector',
	#superclass : 'Object',
	#instVars : [
		'methodVisitor',
		'compiledMethod'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'private' }
TSDAssertionLessDetector >> analyzeMethod [

	self methodVisitor analyzeMethod: compiledMethod 
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> compiledMethod: aCompiledMethod [

	compiledMethod := aCompiledMethod.
	self analyzeMethod 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNoAssertionSelectors [

	^ self methodVisitor helperSelectors allSatisfy: [ :aHelperSelector | 
				(self methodVisitor messages does: compiledMethod includesMessage: aHelperSelector) not ]
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNohelpers [

	^ (self methodVisitor helpers at: compiledMethod) isEmpty 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> isAssertionLess [

	^ self hasNoAssertionSelectors and: [ self hasNohelpers ]
]

{ #category : 'testing' }
TSDAssertionLessDetector >> isAssertionLess: aCompiledMethod [

	^ self 
		compiledMethod: aCompiledMethod;
		isAssertionLess
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := RTDHelperVisitor new ]
]
