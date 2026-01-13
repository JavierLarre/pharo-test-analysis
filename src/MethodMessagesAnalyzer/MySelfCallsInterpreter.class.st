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
		'currentMethod',
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
MySelfCallsInterpreter >> putHelpersConnectedToAssert: aCompiledMethod [
	
	helpers 
		atMethod: aCompiledMethod 
		putHelpers: (messages methodsFrom: aCompiledMethod thatAreConectedTo: #assert:).
]

{ #category : 'api' }
MySelfCallsInterpreter >> selfCalls: aCompiledMethod [
	self send: aCompiledMethod selector fromClass: aCompiledMethod methodClass.
	^ selfSentMethods 
]

{ #category : 'api' }
MySelfCallsInterpreter >> send: aSelector fromClass: aClass [

	selfClass := aClass.
	callStack push: (selfClass lookupSelector: aSelector).
	[ callStack isEmpty ] whileFalse: [ 
		currentMethod := callStack pop.
		currentMethod parseTree acceptVisitor: self ].
	self putHelpersConnectedToAssert: (selfClass lookupSelector: aSelector).
	selfSentMethods do: [ :each | self putHelpersConnectedToAssert: each ]
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
MySelfCallsInterpreter >> visitMessageNode: aMessageNode [

	| previousIsGuarded |
	previousIsGuarded := isGuarded.
	foundMessages add: aMessageNode selector.
	isGuarded ifTrue: [ guardedMessages add: aMessageNode selector ].
	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ 
			isGuarded := true.
			aMessageNode arguments do: [ :each | each acceptVisitor: self ] ].
	isGuarded := previousIsGuarded.
	aMessageNode receiver acceptVisitor: self.
	super visitMessageNode: aMessageNode.
]

{ #category : 'visiting' }
MySelfCallsInterpreter >> visitMethodNode: aMethodNode [

	| oldMethods |
	oldMethods := selfSentMethods .
	foundMessages := Set new.
	selfSentMethods := OrderedCollection new.
	isGuarded := false.
	super visitMethodNode: aMethodNode. 
	messages atMethod: currentMethod putMessages: foundMessages.
	methodsSelfCalls at: currentMethod put: selfSentMethods.
	oldMethods addAll: selfSentMethods.
	selfSentMethods := oldMethods 
]

{ #category : 'visiting' }
MySelfCallsInterpreter >> visitNodes: aMessageNode [
	
	
]
