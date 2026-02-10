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
	self visit: selfSentMethod parseTree
]

{ #category : 'api' }
RTDMethodVisitor >> analyzeMethod: aCompiledMethod [

	self 
		selfClass: aCompiledMethod methodClass;
	 	visit: aCompiledMethod parseTree
]

{ #category : 'initialization' }
RTDMethodVisitor >> initialize [ 

	super initialize.
	foundMethods := OrderedCollection new.
]

{ #category : 'accessing' }
RTDMethodVisitor >> methodsSelfCalls [

	^ methodsSelfCalls ifNil: [ methodsSelfCalls := Dictionary new ]
]

{ #category : 'copying' }
RTDMethodVisitor >> postCopy [ 
	
	methodsSelfCalls := self methodsSelfCalls copy.
	^ self
]

{ #category : 'visiting' }
RTDMethodVisitor >> visitMethodNode: aMethodNode [

	| oldMethods result |
	oldMethods := foundMethods.
	foundMethods := OrderedCollection new.
	result := super visitMethodNode: aMethodNode.
	self methodsSelfCalls at: aMethodNode compiledMethod ifAbsentPut: foundMethods.
	foundMethods := oldMethods . 
	^ result
]
