Class {
	#name : 'RTDMessageVisitorTest',
	#superclass : 'RTDMethodVisitorTest',
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'running' }
RTDMessageVisitorTest >> setUp [ 

	super setUp.
	visitor := RTDMessageVisitor new
]

{ #category : 'tests' }
RTDMessageVisitorTest >> testEmpty [ 

	self
		assertEmpty: visitor messages
]

{ #category : 'tests' }
RTDMessageVisitorTest >> testIncludesMessages [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor messages at: RTDVisitorFixture >> #testHelper)
		includesAll: { #helper . #foo . #notAHelper . #guardedHelper }
]

{ #category : 'tests' }
RTDMessageVisitorTest >> testMessagesEqualsSet [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor messages at: RTDVisitorFixture >> #testHelper)
		equals: { #helper . #foo . #ifTrue: . #notAHelper . #guardedHelper } asSet
]

{ #category : 'tests' }
RTDMessageVisitorTest >> testVisitsAreEqual [ 

	| newVisitor |
	self analyzeMethodFromFixture: #testHelper.
	newVisitor := RTDMessageVisitor new
		analyzeMethod: (self fixtureClass >> #testHelper);
		yourself.
	
	self 
		assert: visitor messages 
		equals: newVisitor messages
]
