"
This class hierarchy is used as data (a TestCase) for TestSmellsDetector test cases.
"
Class {
	#name : 'TSDFixture',
	#superclass : 'Object',
	#instVars : [
		'x',
		'variableSetUpInMethod'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDFixture >> setUp [

	x := 0.
	self setUpVariableInMethod 
]

{ #category : 'running' }
TSDFixture >> setUpVariableInMethod [

	variableSetUpInMethod := 'woah'
]

{ #category : 'tests' }
TSDFixture >> testConnectedToAssignation [

	self x: 1.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFixture >> testIsConnectedToInstanceVar [

	self 
		assert: self x = 0; 
		testUsesInstanceVar 
]

{ #category : 'tests' }
TSDFixture >> testOnlyAssigns [

	x := 1.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFixture >> testUsesInstanceVar [

	self assert: x = 0;
		assert: variableSetUpInMethod 
]

{ #category : 'tests' }
TSDFixture >> testUsesLocalVariables [

	| y |
	y := 1.
	self assert: y = 1
]

{ #category : 'accessing' }
TSDFixture >> x [

	1 asFloat. "hack for not being compiled into a primitive"
	^ x
]

{ #category : 'accessing' }
TSDFixture >> x: anObject [

	x := anObject
]
