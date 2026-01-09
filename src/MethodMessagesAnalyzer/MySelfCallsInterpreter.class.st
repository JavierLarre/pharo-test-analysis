"
playing around
"
Class {
	#name : 'MySelfCallsInterpreter',
	#superclass : 'RTFSelfCallInterpreter',
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'private' }
MySelfCallsInterpreter >> addCallNode: aCallNode [

	selfSentMethods add: selfSentMethod.
	selfSentMethod parseTree acceptVisitor: self
]

{ #category : 'private' }
MySelfCallsInterpreter >> getCallNodeFromMessageNode: aMessageNode [

	^nil
]

{ #category : 'initialization' }
MySelfCallsInterpreter >> initialize [ 
	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ]
]

{ #category : 'api' }
MySelfCallsInterpreter >> selfCalls: aCompiledMethod [
	self send: aCompiledMethod selector fromClass: aCompiledMethod methodClass.
	^ selfSentMethods 
]

{ #category : 'private' }
MySelfCallsInterpreter >> setMethodFromNode: aMessageNode [

	| lookupClass |
	lookupClass := aMessageNode receiver isSuperVariable
		               ifTrue: [ selfClass superclass ]
		               ifFalse: [ selfClass ].

	selfSentMethod := lookupClass lookupSelector: aMessageNode selector.
]
