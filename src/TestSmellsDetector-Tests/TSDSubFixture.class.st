Class {
	#name : 'TSDSubFixture',
	#superclass : 'TSDFixture',
	#instVars : [
		'y',
		'variableSetUpInSubclassMethod'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDSubFixture >> setUp [

	super setUp.
	y := String new.
	self setUpVariableInSubclassMethod: 'wao'
]

{ #category : 'running' }
TSDSubFixture >> setUpVariableInSubclassMethod: anObject [

	variableSetUpInSubclassMethod := anObject 
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
	self assert: y = variableSetUpInSubclassMethod
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
