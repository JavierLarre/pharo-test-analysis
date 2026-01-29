Class {
	#name : 'TSDUselessSetupDetector',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'foundVariables',
		'setupVariables',
		'rootNode',
		'selector',
		'setupSelector'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'private' }
TSDUselessSetupDetector >> analyze [

	super analyze.
	selfSentMethod parseTree acceptVisitor: self
]

{ #category : 'testing' }
TSDUselessSetupDetector >> doesUseSetUp [

	self visit: self rootNode.
	^ (self setupVariables difference: self foundVariables) isEmpty 
]

{ #category : 'private' }
TSDUselessSetupDetector >> findVariablesOf: aMethodNode [

	self foundVariables 
		addAll: (self instanceVariablesOf: aMethodNode where: [ :aNode | aNode parent isAssignment not ] )
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> foundVariables [

	^ foundVariables ifNil: [ foundVariables := OrderedCollection new ]
]

{ #category : 'helpers' }
TSDUselessSetupDetector >> instanceVariablesOf: aNode where: aBlock [

	^ aNode allChildren 
		select: [ :aChildNode | 
			aChildNode isInstanceVariable and: [ aBlock cull: aChildNode ] ]
		thenCollect: #name
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> lookupNode: aSelector [

	^ (selfClass lookupSelector: aSelector) parseTree
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> rootNode [

	^ rootNode ifNil: [ rootNode := self lookupNode: selector ]
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selector: aSelector [

	selector := aSelector 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> setUpSelector [

	^ setupSelector ifNil: [ setupSelector := #setUp ]
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> setupSelector: aSelector [

	^ setupSelector := aSelector
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> setupVariables [

	^ setupVariables ifNil: [
			  | setupNode |
			  setupNode := self lookupNode: self setUpSelector.
			  setupVariables := self instanceVariablesOf: setupNode where: [ :aNode | 
				aNode parent isAssignment ] ]
]

{ #category : 'visiting' }
TSDUselessSetupDetector >> visitMethodNode: aMethodNode [

	self findVariablesOf: aMethodNode.
	super visitMethodNode: aMethodNode
]
