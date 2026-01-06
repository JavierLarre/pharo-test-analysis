"
I should find messages that are related
"
Class {
	#name : 'MaMethodAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'selfCallsFinder',
		'bannedMessages',
		'helpers',
		'messages',
		'messageVisitor'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'evaluating' }
MaMethodAnalyzer >> analyzeMethod: aCompiledMethod [

	| selfCalls compiledHelpers |
	messageVisitor := MaMessageVisitor new.
	self putMessages: aCompiledMethod.
	selfCalls := selfCallsFinder selfCalls: aCompiledMethod.
	selfCalls reject: [ :each | messages includes: each ] thenDo: [ :each | self putMessages: each ].
	compiledHelpers := selfCalls select: [ :each | (messages methodMessages: each) includes: #assert: ].
	helpers atMethod: aCompiledMethod putHelpers: compiledHelpers.
	helpers guardedHelpers: (compiledHelpers select: [ :each | messageVisitor guardedMessages includes: each selector ]).
	messages removeMessages: bannedMessages
]

{ #category : 'accessing' }
MaMethodAnalyzer >> bannedMessages: aCollection [

	bannedMessages := aCollection 
]

{ #category : 'accessing' }
MaMethodAnalyzer >> helpers [ 
	^ helpers copy
]

{ #category : 'initialization' }
MaMethodAnalyzer >> initialize [ 
	super initialize.
	bannedMessages := Set new.
	selfCallsFinder := MaSelfCallsFinderStub new.
	messages := MaMessages new.
	helpers := MaHelpers new 
]

{ #category : 'helpers' }
MaMethodAnalyzer >> messages [
	^messages copy 
]

{ #category : 'evaluating' }
MaMethodAnalyzer >> putMessages: aCompiledMethod [

	messageVisitor visit: aCompiledMethod parseTree.
	messages atMethod: aCompiledMethod parseTree putMessages: messageVisitor foundMessages.
]

{ #category : 'initialization' }
MaMethodAnalyzer >> selfCallsFinder: aSelfCallsFinder [

	selfCallsFinder := aSelfCallsFinder 
]
