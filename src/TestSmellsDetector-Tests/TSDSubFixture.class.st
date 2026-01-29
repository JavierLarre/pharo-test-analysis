Class {
	#name : 'TSDSubFixture',
	#superclass : 'TSDFixture',
	#instVars : [
		'y'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDSubFixture >> setUp [

	super setUp.
	y := String new.
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
TSDSubFixture >> testUsesSomeInstanceVar [

	super testUsesInstanceVar
]

{ #category : 'accessing' }
TSDSubFixture >> y [

	^ y
]

{ #category : 'accessing' }
TSDSubFixture >> y: anObject [

	y := anObject
]
