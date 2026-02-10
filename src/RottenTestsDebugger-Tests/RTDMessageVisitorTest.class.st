Class {
	#name : 'RTDMessageVisitorTest',
	#superclass : 'RTDVisitorTest',
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'tests' }
RTDMessageVisitorTest >> testIncludesMessages [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (self visitor messages at: self fixtureClass >> #testHelper)
		includesAll: { #helper . #foo . #notAHelper . #guardedHelper }
]

{ #category : 'tests' }
RTDMessageVisitorTest >> testMessagesEqualsSet [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (self visitor messages at: self fixtureClass >> #testHelper)
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
		assert: self visitor messages 
		equals: newVisitor messages
]

{ #category : 'tests' }
RTDMessageVisitorTest >> testVisitsHelper [

	self 
		analyzeMethodFromFixture: #testHelper;
		assertCollection: self visitor messages methods 
		hasSameElements: (self fixtureMethodsFrom: #( helper notAHelper testHelper guardedHelper ) )
]

{ #category : 'accessing' }
RTDMessageVisitorTest >> visitorClass [ 

	^ RTDMessageVisitor 
]

{ #category : 'accessing' }
RTDMessageVisitorTest >> visitorMethods [

	^ self visitor messages
]
