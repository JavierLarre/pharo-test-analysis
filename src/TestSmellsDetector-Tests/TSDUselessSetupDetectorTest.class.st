"
An UselessSetupTest is a test class for testing the behavior of UselessSetup
"
Class {
	#name : 'TSDUselessSetupDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'uselessSetup'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDUselessSetupDetectorTest >> fixtureClass [

	^ TSDFixture
]

{ #category : 'running' }
TSDUselessSetupDetectorTest >> setUp [
	super setUp.

	uselessSetup := TSDUselessSetupDetector new.
]

{ #category : 'running' }
TSDUselessSetupDetectorTest >> testDetectsUse [

	self assert: (uselessSetup isUseless: self fixtureClass >> #testUsesInstanceVar ) 
]
