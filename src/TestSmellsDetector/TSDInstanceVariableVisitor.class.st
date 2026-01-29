Class {
	#name : 'TSDInstanceVariableVisitor',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'wasInstanceVarFound'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'API' }
TSDInstanceVariableVisitor >> visit: aMessageNode [
	super visit: aMessageNode.
	^ wasInstanceVarFound 
]

{ #category : 'visiting' }
TSDInstanceVariableVisitor >> visitInstanceVariableNode: aSelfNode [
	
	wasInstanceVarFound := true.
	^ super visitInstanceVariableNode: aSelfNode 
]

{ #category : 'accessing' }
TSDInstanceVariableVisitor >> wasInstanceVarFound [

	^ wasInstanceVarFound
]
