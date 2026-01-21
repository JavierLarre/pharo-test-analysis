"
I visit methods through the RTFSelfCallsVisitorTemplate. I also store the self calls of each method visited.
"
Class {
	#name : 'RTDMethodVisitor',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'methodsSelfCalls',
		'foundMethods'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'private' }
RTDMethodVisitor >> analyze [

	super analyze.
	foundMethods add: selfSentMethod.
	self visitCompiledMethod: selfSentMethod 
]

{ #category : 'api' }
RTDMethodVisitor >> analyzeMethod: aCompiledMethod [

	selfClass := aCompiledMethod methodClass.
	self visitCompiledMethod: aCompiledMethod 
]

{ #category : 'initialization' }
RTDMethodVisitor >> initialize [ 

	super initialize.
	considerClassesThat := [ :class | class inheritsFrom: TestCase ].
	methodsSelfCalls := Dictionary new.
	foundMethods := OrderedCollection new.
]

{ #category : 'accessing' }
RTDMethodVisitor >> methodsSelfCalls [

	^ methodsSelfCalls
]

{ #category : 'visiting' }
RTDMethodVisitor >> visitCompiledMethod: aCompiledMethod [

	| oldMethods |
	oldMethods := foundMethods .
	foundMethods := OrderedCollection new.
	self visitMethodNode: aCompiledMethod parseTree. 
	methodsSelfCalls at: aCompiledMethod put: foundMethods .
	oldMethods addAll: foundMethods .
	foundMethods := oldMethods 
]
