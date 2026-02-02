"
I find instance variables that have been assigned a value
"
Class {
	#name : 'TSDAssignInstancesFinder',
	#superclass : 'TSDInstanceVariablesFinder',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDAssignInstancesFinder >> isValid: aVariableNode [
	
	^ aVariableNode parent isAssignment 
]
