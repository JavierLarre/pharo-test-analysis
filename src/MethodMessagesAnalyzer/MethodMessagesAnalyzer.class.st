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
		'selfCallsFinder'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'evaluating' }
MethodMessagesAnalyzer >> analyzeMethod: aCompiledMethod [

	| selfCalls |
	aCompiledMethod parseTree acceptVisitor: self.
	selfCalls := selfCallsFinder selfCalls: aCompiledMethod.
	selfCalls select: [ :each | (methods keys includes: each parseTree) not ] thenDo: [ :each | self analyzeMethod: each].
	helperMethods at: aCompiledMethod parseTree put: (selfCalls select: [ :each | (methods at: each parseTree) includes: #assert: ]).
	guardedHelpers at: aCompiledMethod parseTree put: (guardedMessages intersection: helperMethods )
]

{ #category : 'initialization' }
MethodMessagesAnalyzer >> initialize [ 
	super initialize. 
	messages := Set new.
	methods := Dictionary new.
	helperMethods := Dictionary new.
	guardedHelpers := Dictionary new.
	guardedMessages := Set new.
	selfCallsFinder := MaSelfCallsFinderStub new 
]

{ #category : 'helpers' }
MethodMessagesAnalyzer >> result [
	^MethodMessagesAnalysisResult 
		analyzedMethods: methods copy
		helperMethods: helperMethods copy 
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
	methods at: aMethodNode put: messages
]
