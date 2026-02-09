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

	selfClass := aCompiledMethod methodClass.
	self visitCompiledMethod: aCompiledMethod 
]

{ #category : 'initialization' }
RTDMethodVisitor >> initialize [ 

	super initialize.
	methodsSelfCalls := Dictionary new.
	foundMethods := OrderedCollection new.
]

{ #category : 'accessing' }
RTDMethodVisitor >> methodsSelfCalls [

	^ methodsSelfCalls
]

{ #category : 'copying' }
RTDMethodVisitor >> postCopy [ 
	
	methodsSelfCalls := methodsSelfCalls copy.
	^ self
]

{ #category : 'visiting' }
RTDMethodVisitor >> visitCompiledMethod: aCompiledMethod [

	self visitMethodNode: aCompiledMethod parseTree
]

{ #category : 'visiting' }
RTDMethodVisitor >> visitMethodNode: aMethodNode [

	| oldMethods result |
	oldMethods := foundMethods.
	foundMethods := OrderedCollection new.
	result := super visitMethodNode: aMethodNode.
	methodsSelfCalls at: aMethodNode compiledMethod ifAbsentPut: foundMethods.
	foundMethods := oldMethods, foundMethods. 
	^ result
]
