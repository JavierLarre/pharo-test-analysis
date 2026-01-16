"
I visit methods through the RTFSelfCallsVisitorTemplate. I also store the self calls of each method visited.
"
Class {
	#name : 'MaMethodVisitor',
	#superclass : 'RTFSelfCallVisitorInterpreter',
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
