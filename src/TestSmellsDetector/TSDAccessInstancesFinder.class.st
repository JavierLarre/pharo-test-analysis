Class {
	#name : 'TSDAccessInstancesFinder',
	#superclass : 'TSDAssignInstancesFinder',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDAccessInstancesFinder >> isValid: aVariableNode [

	^ (super isValid: aVariableNode) not 
]
