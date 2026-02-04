"
I am an abstract visitor for finding variables in program nodes
"
Class {
	#name : 'TSDInstanceVariablesFinder',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'foundVariables',
		'addVariablesSuchThat'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'instance creation' }
TSDInstanceVariablesFinder class >> accessings [

	^ self
		addVariablesSuchThat: [ :aVariableNode | aVariableNode parent isAssignment not ]
]

{ #category : 'instance creation' }
TSDInstanceVariablesFinder class >> addVariablesSuchThat: aBlock [

	^ self new 
		addVariablesSuchThat: aBlock;
		yourself
]

{ #category : 'instance creation' }
TSDInstanceVariablesFinder class >> assignments [

	^ self
		addVariablesSuchThat: [ :aVariableNode | aVariableNode parent isAssignment ]
]

{ #category : 'accessing' }
TSDInstanceVariablesFinder >> addVariablesSuchThat [

	^ addVariablesSuchThat ifNil: [ addVariablesSuchThat := [ true ] ]
]

{ #category : 'testing' }
TSDInstanceVariablesFinder >> addVariablesSuchThat: aBlock [

	addVariablesSuchThat := aBlock 
]

{ #category : 'private' }
TSDInstanceVariablesFinder >> analyze [

	super analyze.
	self visit: selfSentMethod parseTree
]

{ #category : 'accessing' }
TSDInstanceVariablesFinder >> foundVariables [

	^ foundVariables ifNil: [ foundVariables := Set new ]
]

{ #category : 'testing' }
TSDInstanceVariablesFinder >> isValid: aVariableNode [

	^ self addVariablesSuchThat cull: aVariableNode 
]

{ #category : 'visiting' }
TSDInstanceVariablesFinder >> visitVariableNode: aVariableNode [

	(aVariableNode isInstanceVariable and: [ self isValid: aVariableNode ] )
		ifTrue: [ self foundVariables add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
