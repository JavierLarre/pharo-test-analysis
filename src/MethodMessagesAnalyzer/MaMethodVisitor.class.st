"
I analyze methods by visiting them using the RTF interpreter template. The results of my analysis is the messages of the method, the messages sent to self, the guarded messages and the methods that are helpers. 
The same analysis is done on any method called that is on the same class, that is, all the messages sent to self are looked up and analyzed too.
"
Class {
	#name : 'MaMethodVisitor',
	#superclass : 'RTFSelfCallVisitorTemplate',
	#instVars : [
		'methodsSelfCalls',
		'foundMethods'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'private' }
MaMethodVisitor >> analyze [

	super analyze.
	foundMethods add: selfSentMethod.
	self visitCompiledMethod: selfSentMethod 
]

{ #category : 'api' }
MaMethodVisitor >> analyzeMethod: aCompiledMethod [

	selfClass := aCompiledMethod methodClass.
	self visitCompiledMethod: aCompiledMethod 
]

{ #category : 'accessing' }
MaMethodVisitor >> foundMethods [

	^ foundMethods
]

{ #category : 'initialization' }
MaMethodVisitor >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ].
	methodsSelfCalls := Dictionary new.
	foundMethods := OrderedCollection new.
]

{ #category : 'accessing' }
MaMethodVisitor >> methodsSelfCalls [

	^ methodsSelfCalls
]

{ #category : 'visiting' }
MaMethodVisitor >> visitCompiledMethod: aCompiledMethod [

	| memento |
	memento := self copy.
	foundMethods := OrderedCollection new.
	self visitMethodNode: aCompiledMethod parseTree. 
	methodsSelfCalls at: aCompiledMethod put: foundMethods .
	memento foundMethods addAll: foundMethods .
	foundMethods := memento foundMethods 
]
