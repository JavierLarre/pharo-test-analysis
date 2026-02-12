"
I detect whether a test references a classes more than three times
"
Class {
	#name : 'TSDTooManyClassesDetector',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'classReferences'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'visiting' }
TSDTooManyClassesDetector >> classReferences [

	^ classReferences ifNil: [ classReferences := Set new ]
]

{ #category : 'api' }
TSDTooManyClassesDetector >> referencesCount [

	^ self classReferences size
]

{ #category : 'visiting' }
TSDTooManyClassesDetector >> visitVariableNode: aVariableNode [

	aVariableNode isGlobalVariable 
		ifTrue: [ self classReferences add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
