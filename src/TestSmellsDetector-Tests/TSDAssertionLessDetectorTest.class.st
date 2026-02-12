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

{ #category : 'testing' }
TSDAssertionLessDetectorTest >> detectFrom: aSelector [

	^ detector selector: aSelector; detects
]

{ #category : 'accessing' }
TSDAssertionLessDetectorTest >> fixtureClass [

	^ TSDFakeTests
]

{ #category : 'running' }
TSDAssertionLessDetectorTest >> setUp [
	super setUp.

	detector := TSDAssertionLessDetector new
		selfClass: self fixtureClass; yourself.
	detector methodVisitor helperSelectors: #( assert: )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasAssertion [

	self deny: (self detectFrom: #testUsesInstanceVar )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertion [

	self 
		deny: (self detectFrom: #testConnectedToAssertion )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertionTwice [

	self 
		deny: (self detectFrom: #testConnectedToAssertion );
		deny: (self detectFrom: #testConnectedToAssertion )
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self assert: (self detectFrom: #testDoesNotAssert)
]
