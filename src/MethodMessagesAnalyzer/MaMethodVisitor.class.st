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
		self visitCompiledMethod: callStack pop ]
]

{ #category : 'initialization' }
MaMethodVisitor >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ].
	foundMessages := Set new.
	guardedMessages := MaMessages new.
	messages := MaMessages new.
	methodsSelfCalls := Dictionary new.
	callStack := Stack new.
]

{ #category : 'accessing' }
MaMethodVisitor >> methodsSelfCalls [

	^ methodsSelfCalls
]

{ #category : 'visiting' }
MaMethodVisitor >> visitCompiledMethod: aCompiledMethod [

	| oldMethods |
	oldMethods := selfSentMethods .
	selfSentMethods := OrderedCollection new.
	self visitMethodNode: aCompiledMethod parseTree. 
	methodsSelfCalls at: aCompiledMethod put: selfSentMethods.
	oldMethods addAll: selfSentMethods.
	selfSentMethods := oldMethods 
]
