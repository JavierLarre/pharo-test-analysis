"
I count everytime a class (global variable) has been referenced in a method statically, traversing through self calls
"
Class {
	#name : 'TSDClassReferencesVisitor',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'classReferences'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'visiting' }
TSDClassReferencesVisitor >> classReferences [

	^ classReferences ifNil: [ classReferences := Set new ]
]

{ #category : 'api' }
TSDClassReferencesVisitor >> referencesCount [

	^ self classReferences size
]

{ #category : 'visiting' }
TSDClassReferencesVisitor >> visitVariableNode: aVariableNode [

	aVariableNode isGlobalVariable 
		ifTrue: [ self classReferences add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
