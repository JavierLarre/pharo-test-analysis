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

{ #category : 'initialization' }
TSDInstanceVariablesFinder >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ]
]
