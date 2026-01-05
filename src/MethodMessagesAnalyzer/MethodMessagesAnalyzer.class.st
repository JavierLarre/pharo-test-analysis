"
I should find messages that are related
"
Class {
	#name : 'MethodMessagesAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages',
		'methods',
		'guardedHelpers',
		'guardedMessages',
		'helperMethods',
		'selfCallsFinder',
		'bannedMessages',
		'result'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'evaluating' }
MethodMessagesAnalyzer >> analyzeMethod: aCompiledMethod [

	| selfCalls |
	aCompiledMethod parseTree acceptVisitor: self.
	selfCalls := selfCallsFinder selfCalls: aCompiledMethod.
	selfCalls reject: [ :each | result includes: each ] thenDo: [ :each | each parseTree acceptVisitor: self].
	helperMethods at: aCompiledMethod parseTree put: (selfCalls select: [ :each | (result methodMessages: each) includes: #assert: ]).
	guardedHelpers at: aCompiledMethod parseTree put: (guardedMessages intersection: helperMethods ).
	result removeMessages: bannedMessages 
]

{ #category : 'accessing' }
MethodMessagesAnalyzer >> helpers [ 
	^ MaHelpers new 
		helpers: helperMethods;
		yourself
]

{ #category : 'initialization' }
MethodMessagesAnalyzer >> initialize [ 
	super initialize. 
	messages := Set new.
	methods := Dictionary new.
	helperMethods := Dictionary new.
	guardedHelpers := Dictionary new.
	guardedMessages := Set new.
	bannedMessages := { #assert: } asSet.
	selfCallsFinder := MaSelfCallsFinderStub new.
	result := MethodMessagesAnalysisResult new.
]

{ #category : 'helpers' }
MethodMessagesAnalyzer >> result [
	^result copy 
]

{ #category : 'initialization' }
MethodMessagesAnalyzer >> selfCallsFinder: aSelfCallsFinder [

	selfCallsFinder := aSelfCallsFinder 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMessageNode: aMessageNode [
	
	| oldMessages |
	oldMessages := messages.
	messages :=  Set new.
	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ aMessageNode arguments do: [ :each | self visitNode: each ].
			guardedMessages addAll: messages].
	messages := oldMessages.
	messages add: aMessageNode selector.
	super visitMessageNode: aMessageNode.
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMethodNode: aMethodNode [
	
	messages := Set new.
	super visitMethodNode: aMethodNode.
	methods at: aMethodNode put: messages.
	result atMethod: aMethodNode putMessages: messages.
]
