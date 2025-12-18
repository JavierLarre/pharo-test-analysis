"
I should find messages that are related
"
Class {
	#name : 'MyTestAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'initialization' }
MyTestAnalyzer >> initialize [ 
	super initialize. 
	messages := Set new .
]

{ #category : 'accessing' }
MyTestAnalyzer >> messagesFound [
	^messages 
]

{ #category : 'visiting' }
MyTestAnalyzer >> visitMessageNode: aMessageNode [
	messages add: aMessageNode selector.
	super visitMessageNode: aMessageNode 
]
