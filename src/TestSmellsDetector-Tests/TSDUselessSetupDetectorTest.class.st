"
An UselessSetupTest is a test class for testing the behavior of UselessSetup
"
Class {
	#name : 'TSDUselessSetupDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDUselessSetupDetectorTest >> detectorClass [

	^ TSDUselessSetupDetector
]

{ #category : 'running' }
TSDUselessSetupDetectorTest >> testAllVariablesAreUsed [

	self deny: (self detector detectSelector: #testUsesInstanceVar)
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testAssignsAreUseless [

	self assert: (self detector detectSelector: #testOnlyAssigns)
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testConnectedAssigns [

	self assert: (self detector detectSelector: #testConnectedToAssignation)
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testConnectedToUsedVariables [

	self deny: (self detector detectSelector: #testIsConnectedToInstanceVar)
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsDifferentClasses [

	self detector detectSelector: #testUsesLocalVariables .
	self assert: (self detector detect: #y: from: TSDSubFakeTests )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsUseless [

	self assert: (self detector detectSelector: #testUsesLocalVariables)
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testMultipleDetections [

	self
		deny: (self detector detectSelector: #testUsesInstanceVar);
		assert: (self detector detectSelector: #testUsesLocalVariables)
]
