Class {
	#name : 'TSDInstanceVariablesFinder',
	#superclass : 'TSDVariablesFinder',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'visiting' }
TSDInstanceVariablesFinder >> visitVariableNode: aVariableNode [

	aVariableNode parent isAssignment 
		ifFalse: [ self foundVariables add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
