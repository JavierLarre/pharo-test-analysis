"
I am an abstract visitor for finding variables in program nodes
"
Class {
	#name : 'TSDInstanceVariablesFinder',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'foundVariables'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

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

	^ true
]

{ #category : 'visiting' }
TSDInstanceVariablesFinder >> visitVariableNode: aVariableNode [

	(aVariableNode isInstanceVariable and: [ self isValid: aVariableNode ] )
		ifTrue: [ self foundVariables add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
