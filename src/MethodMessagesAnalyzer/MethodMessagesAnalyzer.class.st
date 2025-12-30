"
I should find messages that are related
"
Class {
	#name : 'MethodMessagesAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages',
		'methods',
		'bannedMessages',
		'helperMessages',
		'helperMethods'
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
	helperMessages := { #assert: } asSet.
	helperMethods := Set new.
	bannedMessages := { #assert: } asSet
]

{ #category : 'helpers' }
MethodMessagesAnalyzer >> result [
	^MethodMessagesAnalysisResult withMethods: methods copy 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMessageNode: aMessageNode [
	super visitMessageNode: aMessageNode 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMethodNode: aMethodNode [
	| previousMessages |
	previousMessages := messages.
	messages := Set new.
	super visitMethodNode: aMethodNode.
	methods at: aMethodNode put: (messages difference: bannedMessages).
	(messages intersection: helperMessages) 
		ifNotEmpty: [ helperMethods add: aMethodNode ].
	messages := previousMessages
]
