Class {
	#name : 'TSDAssignmentsFinder',
	#superclass : 'TSDVariablesFinder',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'visiting' }
TSDAssignmentsFinder >> visitAssignmentNode: anAssignmentNode [

	anAssignmentNode variable isInstanceVariable 
		ifTrue: [ self foundVariables add: anAssignmentNode variable name ].
	super visitAssignmentNode: anAssignmentNode 
]
