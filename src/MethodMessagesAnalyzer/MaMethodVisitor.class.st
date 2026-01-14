"
I analyze methods by visiting them using the RTF interpreter template. The results of my analysis is the messages of the method, the messages sent to self, the guarded messages and the methods that are helpers. 
The same analysis is done on any method called that is on the same class, that is, all the messages sent to self are looked up and analyzed too.
"
Class {
	#name : 'MaMethodVisitor',
	#superclass : 'RTFSelfCallVisitorTemplate',
	#instVars : [
		'foundMessages',
		'guardedMessages',
		'methodsSelfCalls',
		'isGuarded',
		'messages',
		'helpers',
		'guardedHelpers',
		'foundGuardedMessages',
		'callStack'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'private' }
MaMethodVisitor >> analyze [

	super analyze.
	callStack push: selfSentMethod 
]

{ #category : 'api' }
MaMethodVisitor >> analyzeMethod: aCompiledMethod [

	selfClass := aCompiledMethod methodClass.
	callStack push: aCompiledMethod .
	[ callStack isEmpty ] whileFalse: [ 
		self visitCompiledMethod: callStack pop ].
	self putHelpersConnectedTo: aCompiledMethod.
	selfSentMethods do: [ :each | self putHelpersConnectedTo: each ]
]

{ #category : 'accessing' }
MaMethodVisitor >> guardedHelpers [ 
	^ guardedHelpers 
]

{ #category : 'accessing' }
MaMethodVisitor >> guardedMessages [ 
	^ guardedMessages 
]

{ #category : 'accessing' }
MaMethodVisitor >> helpers [ 
	
	^ helpers 
]

{ #category : 'initialization' }
MaMethodVisitor >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ].
	foundMessages := Set new.
	guardedMessages := MaMessages new.
	messages := MaMessages new.
	helpers := MaHelpers new.
	guardedHelpers := MaHelpers new.
	methodsSelfCalls := Dictionary new.
	callStack := Stack new.
]

{ #category : 'accessing' }
MaMethodVisitor >> messages [
	
	^ messages
]

{ #category : 'accessing' }
MaMethodVisitor >> methodsSelfCalls [

	^ methodsSelfCalls
]

{ #category : 'private' }
MaMethodVisitor >> putHelpersConnectedTo: aCompiledMethod [
	
	helpers 
		atMethod: aCompiledMethod 
		putHelpers: (messages methodsFrom: aCompiledMethod thatAreConectedTo: #assert:).
	guardedHelpers 
		atMethod: aCompiledMethod 
		putHelpers: ( 
			( helpers helpersOf: aCompiledMethod ) select: [ :helper | guardedMessages method: aCompiledMethod containsMessage: helper selector ] ) 
]

{ #category : 'visiting' }
MaMethodVisitor >> visitCompiledMethod: aCompiledMethod [

	| oldMethods |
	oldMethods := selfSentMethods .
	foundMessages := Set new.
	foundGuardedMessages := Set new.
	selfSentMethods := OrderedCollection new.
	isGuarded := false.
	self visitMethodNode: aCompiledMethod parseTree. 
	messages atMethod: aCompiledMethod putMessages: foundMessages.
	guardedMessages atMethod: aCompiledMethod putMessages: foundGuardedMessages.
	methodsSelfCalls at: aCompiledMethod put: selfSentMethods.
	oldMethods addAll: selfSentMethods.
	selfSentMethods := oldMethods 
]

{ #category : 'visiting' }
MaMethodVisitor >> visitMessageNode: aMessageNode [

	| previousIsGuarded |
	previousIsGuarded := isGuarded.
	foundMessages add: aMessageNode selector.
	isGuarded ifTrue: [ foundGuardedMessages add: aMessageNode selector ].
	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ isGuarded := true ].
	
	aMessageNode arguments do: [ :each | each acceptVisitor: self ].
	isGuarded := previousIsGuarded.
	aMessageNode receiver acceptVisitor: self.
	super visitMessageNode: aMessageNode.
]

{ #category : 'visiting' }
MaMethodVisitor >> visitNodes: aMessageNode [
	
	
]
