"
A TSDAssertionLessDetectorTest is a test class for testing the behavior of TSDAssertionLessDetector
"
Class {
	#name : 'TSDAssertionLessDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'detector'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDAssertionLessDetectorTest >> fixtureClass [

	^ TSDFixture
]

{ #category : 'running' }
TSDAssertionLessDetectorTest >> setUp [
	super setUp.

	detector := TSDAssertionLessDetector new.
	detector methodVisitor helperSelectors: #( assert: )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasAssertion [

	self deny: (detector isAssertionLess: self fixtureClass >> #testUsesInstanceVar )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertion [

	self 
		deny: (detector isAssertionLess: self fixtureClass >> #testConnectedToAssertion )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertionTwice [

	self 
		deny: (detector isAssertionLess: self fixtureClass >> #testConnectedToAssertion );
		deny: (detector isAssertionLess: self fixtureClass >> #testConnectedToAssertion )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self assert: (detector isAssertionLess: self fixtureClass >> #testDoesNotAssert )
]
