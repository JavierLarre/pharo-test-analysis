"
A TSDAssertionLessDetectorTest is a test class for testing the behavior of TSDAssertionLessDetector
"
Class {
	#name : 'TSDAssertionLessDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDAssertionLessDetectorTest >> detector [ 

	^ detector ifNil: [ detector := super detector.
		detector methodVisitor helperSelectors: #( assert: ).
		^detector ]
]

{ #category : 'accessing' }
TSDAssertionLessDetectorTest >> detectorClass [ 

	^ TSDAssertionLessDetector 
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasAssertion [

	self deny: (self detector detectSelector: #testUsesInstanceVar)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertion [

	self deny: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertionTwice [

	self
		deny: (self detector detectSelector: #testConnectedToAssertion);
		deny: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self assert: (self detector detectSelector: #testDoesNotAssert)
]
