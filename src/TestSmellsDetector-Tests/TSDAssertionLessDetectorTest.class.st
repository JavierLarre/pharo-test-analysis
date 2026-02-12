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

	self deny: (self doesDetect: #testUsesInstanceVar )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertion [

	self 
		deny: (self doesDetect: #testConnectedToAssertion )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertionTwice [

	self 
		deny: (self doesDetect: #testConnectedToAssertion );
		deny: (self doesDetect: #testConnectedToAssertion )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self assert: (self doesDetect: #testDoesNotAssert)
]
