"
I should find messages that are related
"
Class {
	#name : 'MethodMessagesAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages',
		'methods',
		'bannedMessages'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'evaluating' }
MethodMessagesAnalyzer >> analyzeMethod: aCompiledMethod [
	^ self visit: aCompiledMethod parseTree 
]

{ #category : 'initialization' }
MethodMessagesAnalyzer >> initialize [ 
	super initialize. 
	messages := Set new.
	methods := Dictionary new.
	bannedMessages := { #assert: } asSet 
]

{ #category : 'helpers' }
MethodMessagesAnalyzer >> result [
	^MethodMessagesAnalysisResult withMethods: methods copy 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMessageNode: aMessageNode [
	(bannedMessages includes: aMessageNode selector)
		ifFalse: [ messages add: aMessageNode selector].
	super visitMessageNode: aMessageNode 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMethodNode: aMethodNode [
	| previousMessages |
	previousMessages := messages.
	messages := Set new.
	super visitMethodNode: aMethodNode.
	methods at: aMethodNode put: messages.
	messages := previousMessages
]
