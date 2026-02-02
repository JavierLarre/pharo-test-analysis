Class {
	#name : 'TSDVariablesFinder',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'foundVariables'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'private' }
TSDVariablesFinder >> analyze [

	super analyze.
	self visit: selfSentMethod parseTree
]

{ #category : 'accessing' }
TSDVariablesFinder >> foundVariables [

	^ foundVariables ifNil: [ foundVariables := Set new ]
]

{ #category : 'initialization' }
TSDVariablesFinder >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ]
]
