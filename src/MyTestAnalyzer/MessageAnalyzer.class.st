"
I should find messages that are related
"
Class {
	#name : 'MessageAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'methodMessages',
		'messagesFound'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'initialization' }
MessageAnalyzer >> initialize [ 
	super initialize. 
	messagesFound := Set new.
	methodMessages := Dictionary new
]

{ #category : 'accessing' }
MessageAnalyzer >> messagesFound [
	^messagesFound 
]

{ #category : 'helpers' }
MessageAnalyzer >> result [
	^AnalysisResult withMessages: methodMessages 
]

{ #category : 'visiting' }
MessageAnalyzer >> visitMessageNode: aMessageNode [
	messagesFound add: aMessageNode selector.
	super visitMessageNode: aMessageNode 
]

{ #category : 'visiting' }
MessageAnalyzer >> visitMethodNode: aMethodNode [
	super visitMethodNode: aMethodNode.
	methodMessages at: aMethodNode selector put: messagesFound 
]
