"
I detect whether an AST contains to many class references
"
Class {
	#name : 'OverreferencingDetector',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'references',
		'allowedReferences'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'initialization' }
OverreferencingDetector >> initialize [ 
	super initialize. 
	references := 0.
	allowedReferences := 3.
]

{ #category : 'visiting' }
OverreferencingDetector >> visitVariableNode: aVariableNode [
	aVariableNode isClassVariable 
		ifTrue: [ references := references + 1 ].
		
	^super visitVariableNode: aVariableNode 
]
