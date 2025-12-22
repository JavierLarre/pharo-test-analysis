"
I should find messages that are related
"
Class {
	#name : 'MessageAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages',
		'methods',
		'bannedMessages'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'evaluating' }
MessageAnalyzer >> analyzeMethod: aProgramNode [
	^ self visit: aProgramNode 
]

{ #category : 'initialization' }
MessageAnalyzer >> initialize [ 
	super initialize. 
	methods := Set new.
	methods := Dictionary new.
	bannedMessages := { #assert: } asSet 
]

{ #category : 'accessing' }
MessageAnalyzer >> messagesFound [
	^methods 
]

{ #category : 'helpers' }
MessageAnalyzer >> result [
	^AnalysisResult withMethods: methods copy 
]

{ #category : 'visiting' }
MessageAnalyzer >> visitMessageNode: aMessageNode [
	(bannedMessages includes: aMessageNode selector)
		ifFalse: [ messages add: aMessageNode selector].
	super visitMessageNode: aMessageNode 
]

{ #category : 'visiting' }
MessageAnalyzer >> visitMethodNode: aMethodNode [
	| previousMessages |
	previousMessages := messages .
	messages := Set new.
	super visitMethodNode: aMethodNode.
	methods at: aMethodNode selector put: messages.
	messages := previousMessages 
]
