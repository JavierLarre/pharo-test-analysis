Class {
	#name : 'TSDSubFixture',
	#superclass : 'TSDFixture',
	#instVars : [
		'y',
		'subVariableAssigned'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDSubFixture >> assignSubVariable: anObject [

	subVariableAssigned := anObject 
]

{ #category : 'running' }
TSDSubFixture >> setUp [

	super setUp.
	y := String new.
	self assignSubVariable: 'wao'
]

{ #category : 'tests' }
TSDSubFixture >> testAssignsSomeInstanceVar [

	super testOnlyAssigns 
]

{ #category : 'tests' }
TSDSubFixture >> testConnectedToAssignation [

	super testConnectedToAssignation.
	self y: 'a'.
]

{ #category : 'tests' }
TSDSubFixture >> testIsConnectedToInstanceVar [

	super testIsConnectedToInstanceVar.
	self assert: self y
]

{ #category : 'tests' }
TSDSubFixture >> testOnlyAssigns [

	super testOnlyAssigns.
	y := 'woa'
]

{ #category : 'tests' }
TSDSubFixture >> testUsesInstanceVar [ 

	super testUsesInstanceVar.
	self assert: y = subVariableAssigned
]

{ #category : 'accessing' }
TSDSubFixture >> y [

	^ y
]

{ #category : 'accessing' }
TSDSubFixture >> y: anObject [

	y := anObject
]
