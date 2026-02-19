"
A TSDOverWrittenSetupDetectorTest is a test class for testing the behavior of TSDOverWrittenSetupDetector
"
Class {
	#name : 'TSDOverWrittenSetupDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDOverWrittenSetupDetectorTest >> detectorClass [

	^ TSDOverWrittenSetupDetector
]

{ #category : 'tests' }
TSDOverWrittenSetupDetectorTest >> testDetectsOverWrite [

	self assert: (self detector detectSelector: #testOnlyAssigns)
]
