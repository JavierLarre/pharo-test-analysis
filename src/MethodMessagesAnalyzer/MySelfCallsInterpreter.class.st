"
playing around
"
Class {
	#name : 'MySelfCallsInterpreter',
	#superclass : 'RTFSelfCallInterpreter',
	#instVars : [
		'foundMessages',
		'guardedMessages',
		'messages',
		'methodsSelfCalls',
		'isGuarded',
		'helpers'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'private' }
MySelfCallsInterpreter >> addCallNode: aCallNode [

	selfSentMethods add: selfSentMethod.
	callStack push: selfSentMethod 
]

{ #category : 'api' }
MySelfCallsInterpreter >> analyzeMethod: aCompiledMethod [

	selfClass := aCompiledMethod methodClass.
	callStack push: aCompiledMethod .
	[ callStack isEmpty ] whileFalse: [ 
		self visitCompiledMethod: callStack pop ].
	self putHelpersConnectedTo: aCompiledMethod.
	selfSentMethods do: [ :each | self putHelpersConnectedTo: each ]
]

{ #category : 'private' }
MySelfCallsInterpreter >> getCallNodeFromMessageNode: aMessageNode [

	^nil
]

{ #category : 'accessing' }
MySelfCallsInterpreter >> guardedMessages [ 
	^ guardedMessages 
]

{ #category : 'accessing' }
MySelfCallsInterpreter >> helpers [ 
	
	^ helpers 
]

{ #category : 'initialization' }
MySelfCallsInterpreter >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ].
	foundMessages := Set new.
	guardedMessages := Set new.
	messages := MaMessages new .
	helpers := MaHelpers new.
	methodsSelfCalls := Dictionary new
]

{ #category : 'private' }
MySelfCallsInterpreter >> putHelpersConnectedTo: aCompiledMethod [
	
	helpers 
		atMethod: aCompiledMethod 
		putHelpers: (messages methodsFrom: aCompiledMethod thatAreConectedTo: #assert:).
]

{ #category : 'api' }
MySelfCallsInterpreter >> send: aSelector fromClass: aClass [

	self analyzeMethod: (aClass lookupSelector: aSelector)
]

{ #category : 'private' }
MySelfCallsInterpreter >> setMethodFromNode: aMessageNode [

	| lookupClass |
	lookupClass := aMessageNode receiver isSuperVariable
		               ifTrue: [ selfClass superclass ]
		               ifFalse: [ selfClass ].

	selfSentMethod := lookupClass lookupSelector: aMessageNode selector.
]

{ #category : 'visiting' }
MySelfCallsInterpreter >> visitCompiledMethod: aCompiledMethod [

	| oldMethods |
	oldMethods := selfSentMethods .
	foundMessages := Set new.
	selfSentMethods := OrderedCollection new.
	isGuarded := false.
	self visitMethodNode: aCompiledMethod parseTree. 
	messages atMethod: aCompiledMethod putMessages: foundMessages.
	methodsSelfCalls at: aCompiledMethod put: selfSentMethods.
	oldMethods addAll: selfSentMethods.
	selfSentMethods := oldMethods 
]

{ #category : 'visiting' }
MySelfCallsInterpreter >> visitMessageNode: aMessageNode [

	| previousIsGuarded |
	previousIsGuarded := isGuarded.
	foundMessages add: aMessageNode selector.
	isGuarded ifTrue: [ guardedMessages add: aMessageNode selector ].
	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ isGuarded := true ].
	
	aMessageNode arguments do: [ :each | each acceptVisitor: self ].
	isGuarded := previousIsGuarded.
	aMessageNode receiver acceptVisitor: self.
	super visitMessageNode: aMessageNode.
]

{ #category : 'visiting' }
MySelfCallsInterpreter >> visitNodes: aMessageNode [
	
	
]
