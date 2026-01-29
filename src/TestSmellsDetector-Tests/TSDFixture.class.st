Class {
	#name : 'TSDFixture',
	#superclass : 'Object',
	#instVars : [
		'x'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDFixture >> setUp [

	x := 0
]

{ #category : 'tests' }
TSDFixture >> testConnectedToAssignation [

	self x: 1.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFixture >> testDoesNotUsesInstanceVar [

	| y |
	y := 1.
	self assert: y = 1
]

{ #category : 'tests' }
TSDFixture >> testIsConnectedToInstanceVar [

	self assert: self x = 0
]

{ #category : 'tests' }
TSDFixture >> testOnlyAssigns [

	x := 1.
	self assert: 1 = 1
]

{ #category : 'tests' }
TSDFixture >> testUsesInstanceVar [

	self assert: x = 0
]

{ #category : 'accessing' }
TSDFixture >> x [

	^ x
]

{ #category : 'accessing' }
TSDFixture >> x: anObject [

	x := anObject
]
