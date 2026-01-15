Class {
	#name : 'MaMessagesVisitorTest',
	#superclass : 'MaMethodVisitorTest',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaMessagesVisitorTest >> setUp [ 

	super setUp.
	visitor := MaMessageVisitor new
]

{ #category : 'tests' }
MaMessagesVisitorTest >> testDifferentiatesNestedGuardedMessages [

	| guardedMessages |
	self analyzeMethodFromFixture: #testHelper.
	
	guardedMessages := visitor guardedMessages methodMessages: (self fixtureMethod: #testHelper).

	self
		assertCollection: guardedMessages includesAll: { #guardedHelper };
		denyCollection: guardedMessages includesAll: { #helper }
]

{ #category : 'tests' }
MaMessagesVisitorTest >> testEmpty [ 

	self
		assertEmpty: visitor messages methodsAnalyzed ;
		assertEmpty: visitor guardedMessages methodsAnalyzed 
]

{ #category : 'tests' }
MaMessagesVisitorTest >> testGuardedMessagesAreConnected [

	| testBigHelperGuarded |
	self analyzeMethodFromFixture: #testBigHelperGuarded.
	testBigHelperGuarded := self fixtureMethod: #testBigHelperGuarded.

	self
		assertCollection: (visitor guardedMessages methodMessages: testBigHelperGuarded) hasSameElements: { #bigHelper };
		assertCollection: (visitor guardedMessages methodMessages: (self fixtureMethod: #bigHelper))
		hasSameElements: { #guardedHelper };
		assert: (visitor guardedMessages method: testBigHelperGuarded isConnectedToMessage: #guardedHelper)
]

{ #category : 'tests' }
MaMessagesVisitorTest >> testIncludesGuardedMessages [

	| guardedMessages |
	self analyzeMethodFromFixture: #testHelper.
	guardedMessages := visitor guardedMessages methodMessages: (self fixtureMethod: #testHelper).

	self assertCollection: guardedMessages hasSameElements: { #guardedHelper }
]

{ #category : 'tests' }
MaMessagesVisitorTest >> testIncludesMessages [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor messages methodMessages: MaVisitorFixture >> #testHelper)
		includesAll: { #helper . #foo . #ifTrue: . #notAHelper }
]

{ #category : 'tests' }
MaMessagesVisitorTest >> testVisitsAreEqual [ 

	| newVisitor |
	self analyzeMethodFromFixture: #testHelper.
	newVisitor := MaMessageVisitor new
		analyzeMethod: (self fixtureMethod: #testHelper);
		yourself.
	
	self 
		assert: visitor messages 
		equals: newVisitor messages;
		assert: visitor guardedMessages 
		equals: newVisitor guardedMessages 
]
