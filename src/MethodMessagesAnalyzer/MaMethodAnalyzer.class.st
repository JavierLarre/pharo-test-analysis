"
I should find messages that are related
"
Class {
	#name : 'MaMethodAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'guardedMessages',
		'selfCallsFinder',
		'bannedMessages',
		'helpers',
		'messagesFound',
		'messages'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'evaluating' }
MaMethodAnalyzer >> analyzeMethod: aCompiledMethod [

	| selfCalls compiledHelpers |
	aCompiledMethod parseTree acceptVisitor: self.
	selfCalls := selfCallsFinder selfCalls: aCompiledMethod.
	selfCalls reject: [ :each | messages includes: each ] thenDo: [ :each | each parseTree acceptVisitor: self ].
	compiledHelpers := selfCalls select: [ :each | (messages methodMessages: each) includes: #assert: ].
	helpers atMethod: aCompiledMethod putHelpers: compiledHelpers.
	helpers guardedHelpers: (compiledHelpers select: [ :each | guardedMessages includes: each selector ]).
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
	messagesFound := Set new.
	guardedMessages := Set new.
	bannedMessages := Set new.
	selfCallsFinder := MaSelfCallsFinderStub new.
	messages := MaMessages new.
	helpers := MaHelpers new 
]

{ #category : 'helpers' }
MaMethodAnalyzer >> messages [
	^messages copy 
]

{ #category : 'initialization' }
MaMethodAnalyzer >> selfCallsFinder: aSelfCallsFinder [

	selfCallsFinder := aSelfCallsFinder 
]

{ #category : 'visiting' }
MaMethodAnalyzer >> visitMessageNode: aMessageNode [
	
	| oldMessages |
	oldMessages := messagesFound.
	messagesFound :=  Set new.
	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ aMessageNode arguments do: [ :each | self visitNode: each ].
			guardedMessages addAll: messagesFound].
	messagesFound := oldMessages.
	messagesFound add: aMessageNode selector.
	super visitMessageNode: aMessageNode.
]

{ #category : 'visiting' }
MaMethodAnalyzer >> visitMethodNode: aMethodNode [
	
	messagesFound := Set new.
	super visitMethodNode: aMethodNode.
	messages atMethod: aMethodNode putMessages: messagesFound.
]
