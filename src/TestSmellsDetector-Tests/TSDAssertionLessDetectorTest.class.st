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

{ #category : 'as yet unclassified' }
TSDAssertionLessDetectorTest >> fixtureClass [

	^ TSDFixture
]

{ #category : 'running' }
TSDAssertionLessDetectorTest >> setUp [
	super setUp.

	detector := TSDAssertionLessDetector new.
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self assert: (detector isAssertionLess: self fixtureClass >> #testDoesNotAssert )
]
