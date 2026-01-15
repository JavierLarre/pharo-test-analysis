Class {
	#name : 'MaHelperMessagesVisitorTest',
	#superclass : 'MaMethodVisitorTest',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaHelperMessagesVisitorTest >> setUp [ 

	super setUp.
	visitor := MaMessageCollectorVisitor new
]

{ #category : 'tests' }
MaHelperMessagesVisitorTest >> testDifferentiatesNestedGuardedMessages [

	| guardedMessages |
	self analyzeMethodFromFixture: #testHelper.
	
	guardedMessages := visitor guardedMessages methodMessages: (self fixtureMethod: #testHelper).

	self
		assertCollection: guardedMessages includesAll: { #guardedHelper };
		denyCollection: guardedMessages includesAll: { #helper }
]

{ #category : 'tests' }
MaHelperMessagesVisitorTest >> testEmpty [ 

	self
		assertEmpty: visitor messages methodsAnalyzed ;
		assertEmpty: visitor guardedMessages methodsAnalyzed 
]

{ #category : 'tests' }
MaHelperMessagesVisitorTest >> testGuardedMessagesAreConnected [

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
MaHelperMessagesVisitorTest >> testIncludesGuardedMessages [

	| guardedMessages |
	self analyzeMethodFromFixture: #testHelper.
	guardedMessages := visitor guardedMessages methodMessages: (self fixtureMethod: #testHelper).

	self assertCollection: guardedMessages hasSameElements: { #guardedHelper }
]

{ #category : 'tests' }
MaHelperMessagesVisitorTest >> testIncludesMessages [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor messages methodMessages: MaHelperFixture >> #testHelper)
		includesAll: { #helper . #foo . #ifTrue: . #notAHelper }
]

{ #category : 'tests' }
MaHelperMessagesVisitorTest >> testVisitsAreEqual [ 

	| newVisitor |
	self analyzeMethodFromFixture: #testHelper.
	newVisitor := MaMessageCollectorVisitor new
		analyzeMethod: (self fixtureMethod: #testHelper);
		yourself.
	
	self 
		assert: visitor messages 
		equals: newVisitor messages;
		assert: visitor guardedMessages 
		equals: newVisitor guardedMessages 
]
