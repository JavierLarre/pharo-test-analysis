"
A TSDOverWrittenSetupDetectorTest is a test class for testing the behavior of TSDOverWrittenSetupDetector
"
Class {
	#name : 'TSDOverwrittenSetupDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDOverwrittenSetupDetectorTest >> detectorClass [

	^ TSDOverwrittenSetupDetector
]

{ #category : 'tests' }
TSDOverwrittenSetupDetectorTest >> testDetectsDifferentClasses [

	self detector detectSelector: #testOnlyAssigns.
	self assert: (self detector detect: #y: from: TSDSubFakeTests )
]

{ #category : 'tests' }
TSDOverwrittenSetupDetectorTest >> testDetectsOverWrite [

	self detector selector: #testOnlyAssigns.
	self assertCollection: self detector result overwrittenVariables hasSameElements: { #x }
]
