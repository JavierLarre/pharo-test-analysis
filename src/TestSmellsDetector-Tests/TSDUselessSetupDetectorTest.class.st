"
An UselessSetupTest is a test class for testing the behavior of UselessSetup
"
Class {
	#name : 'TSDUselessSetupDetectorTest',
	#superclass : 'TSDFixtureTest',
	#instVars : [
		'detector'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'helpers' }
TSDUselessSetupDetectorTest >> doesUseSetUp: aSelector [

	^ detector selector: aSelector;
		doesUseSetUp 
]

{ #category : 'running' }
TSDUselessSetupDetectorTest >> setUp [
	
	super setUp.
	detector := TSDUselessSetupDetector new
		considerClassesThat: [ :class | class inheritsFrom: TestCase ];
		selfClass: self fixtureClass;
		yourself.
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testAssignsAreUseless [

	self deny: (self doesUseSetUp: #testOnlyAssigns )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testConnectedAssigns [

	self deny: (self doesUseSetUp: #testConnectedToAssignation )
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsConnected [

	self assert: (self doesUseSetUp: #testIsConnectedToInstanceVar )
]

{ #category : 'running' }
TSDUselessSetupDetectorTest >> testDetectsUse [

	self assert: (self doesUseSetUp: #testUsesInstanceVar) 
]

{ #category : 'tests' }
TSDUselessSetupDetectorTest >> testDetectsUseless [

	self deny: (self doesUseSetUp: #testDoesNotUsesInstanceVar ) 
]
