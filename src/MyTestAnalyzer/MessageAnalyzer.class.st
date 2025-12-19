"
I should find messages that are related
"
Class {
	#name : 'MessageAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'helpers' }
MessageAnalyzer >> getResult [
	^AnalysisResult withMessages: messages 
]

{ #category : 'initialization' }
MessageAnalyzer >> initialize [ 
	super initialize. 
	messages := Set new .
]

{ #category : 'accessing' }
MessageAnalyzer >> messagesFound [
	^messages 
]

{ #category : 'visiting' }
MessageAnalyzer >> visitMessageNode: aMessageNode [
	messages add: aMessageNode selector.
	super visitMessageNode: aMessageNode 
]
