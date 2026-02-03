"
This class hierarchy is used as data (a TestCase) for TestSmellsDetector test cases.
Some methods may add seemingly useless statements that are needed for the compiler to not optimize small methods into primitives 
"
Class {
	#name : 'TSDFixture',
	#superclass : 'Object',
	#instVars : [
		'x',
		'assignedVariable'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDFixture >> assignVariable [

	assignedVariable := 'woah'
]

{ #category : 'running' }
TSDFixture >> setUp [

	x := 0.
	self assignVariable 
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
TSDFixture >> testUsesClasses [

	TSDTooManyClassesDetector new
]

{ #category : 'tests' }
TSDFixture >> testUsesInstanceVar [

	self assert: x = 0;
		assert: assignedVariable 
]

{ #category : 'tests' }
TSDFixture >> testUsesLocalVariables [

	| x |
	x := 1.
	self assert: x = 1
]

{ #category : 'accessing' }
TSDFixture >> x [

	1 asFloat.
	^ x
]

{ #category : 'accessing' }
TSDFixture >> x: anObject [

	x := anObject
]
