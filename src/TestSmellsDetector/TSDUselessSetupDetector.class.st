Class {
	#name : 'TSDUselessSetupDetector',
	#superclass : 'Object',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDUselessSetupDetector >> isUseless: aCompiledMethod [ 
	
	^ TSDInstanceVariableVisitor new 
		visit: aCompiledMethod parseTree;
		wasInstanceVarFound 
]
