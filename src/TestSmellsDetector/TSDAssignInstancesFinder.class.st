Class {
	#name : 'TSDAssignInstancesFinder',
	#superclass : 'TSDInstanceVariablesFinder',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'visiting' }
TSDAssignInstancesFinder >> visitVariableNode: aVariableNode [

	aVariableNode parent isAssignment & aVariableNode isInstanceVariable 
		ifTrue: [ self foundVariables add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
