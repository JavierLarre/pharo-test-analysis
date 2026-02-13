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

{ #category : 'api' }
TSDClassReferencesVisitor >> anyClassIsReferencedMoreThan: aNumber [

	^ self classReferences anySatisfy: [ :class | (self referencesOf: class) >= aNumber ]
]

{ #category : 'visiting' }
TSDClassReferencesVisitor >> classReferences [

	^ classReferences ifNil: [ classReferences := Bag new ]
]

{ #category : 'api' }
TSDClassReferencesVisitor >> referencesCount [

	^ self classReferences asSet size
]

{ #category : 'private' }
TSDClassReferencesVisitor >> referencesOf: aClass [

	^ self classReferences occurrencesOf: aClass 
]

{ #category : 'visiting' }
TSDClassReferencesVisitor >> visitVariableNode: aVariableNode [

	aVariableNode isGlobalVariable ifTrue: [ self classReferences add: aVariableNode variable value ].
	super visitVariableNode: aVariableNode
]
