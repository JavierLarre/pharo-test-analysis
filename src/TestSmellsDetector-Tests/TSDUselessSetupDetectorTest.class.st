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

	self deny: (self doesDetect: #testUsesInstanceVar) 
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testAssignsAreUseless [

	self assert: (self doesDetect: #testOnlyAssigns )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testConnectedAssigns [

	self assert: (self doesDetect: #testConnectedToAssignation )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testConnectedToUsedVariables [

	self deny: (self doesDetect: #testIsConnectedToInstanceVar )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsUseless [

	self assert: (self doesDetect: #testUsesLocalVariables ) 
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testMultipleDetections [

	self 
		deny: (self doesDetect: #testUsesInstanceVar );
		assert: (self doesDetect: #testUsesLocalVariables )
]
