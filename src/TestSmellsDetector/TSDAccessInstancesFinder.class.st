Class {
	#name : 'TSDAccessInstancesFinder',
	#superclass : 'TSDInstanceVariablesFinder',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'visiting' }
TSDAccessInstancesFinder >> visitVariableNode: aVariableNode [

	aVariableNode parent isAssignment not & aVariableNode isInstanceVariable  
		ifTrue: [ self foundVariables add: aVariableNode name ].
	super visitVariableNode: aVariableNode 
]
