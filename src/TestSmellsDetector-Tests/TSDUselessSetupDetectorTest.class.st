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

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testAssignsAreUseless [

	self deny: (self doesDetect: #testOnlyAssigns )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testConnectedAssigns [

	self deny: (self doesDetect: #testConnectedToAssignation )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsConnected [

	self assert: (self doesDetect: #testIsConnectedToInstanceVar )
]

{ #category : 'running' }
TSDUselessSetupDetectorTest >> testDetectsUse [

	self assert: (self doesDetect: #testUsesInstanceVar) 
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsUseless [

	self deny: (self doesDetect: #testUsesLocalVariables ) 
]
