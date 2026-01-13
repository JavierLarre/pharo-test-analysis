Class {
	#name : 'MaMethodVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'as yet unclassified' }
MaMethodVisitorTest >> analyzeMethodFromFixture: aSelector [
	
	visitor analyzeMethod:( self helperMethodFromFixture: aSelector )
]

{ #category : 'as yet unclassified' }
MaMethodVisitorTest >> helperMethodFromFixture: aSelector [
	
	^MaHelperFixture >> aSelector 
]

{ #category : 'running' }
MaMethodVisitorTest >> setUp [
	super setUp.
	visitor := MaMethodVisitor new.
	MaHelperFixture superclass: TestCase 
]

{ #category : 'running' }
MaMethodVisitorTest >> tearDown [ 
	MaHelperFixture superclass: Object.
	super tearDown 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testDifferentiatesNestedGuardedMessages [

	| guardedMessages |
	self analyzeMethodFromFixture: #testHelper.
	
	guardedMessages := visitor guardedMessages methodMessages: (self helperMethodFromFixture: #testHelper).

	self
		assertCollection: guardedMessages includesAll: { #guardedHelper };
		denyCollection: guardedMessages includesAll: { #helper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testFindsMessagesSentToSelf [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: visitor selfSentMethods 
		includesAll: { self helperMethodFromFixture: #helper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testGuardedMessagesAreConnected [

	| testBigHelperGuarded |
	self analyzeMethodFromFixture: #testBigHelperGuarded.
	testBigHelperGuarded := self helperMethodFromFixture: #testBigHelperGuarded.

	self
		assertCollection: (visitor guardedMessages methodMessages: testBigHelperGuarded) hasSameElements: { #bigHelper };
		assertCollection: (visitor guardedMessages methodMessages: (self helperMethodFromFixture: #bigHelper))
		hasSameElements: { #guardedHelper };
		assert: (visitor guardedMessages method: testBigHelperGuarded isConnectedToMessage: #guardedHelper)
]

{ #category : 'tests' }
MaMethodVisitorTest >> testHasMethodSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self helperMethodFromFixture: #testHelper)) 
		hasSameElements: { 
			self helperMethodFromFixture: #helper . 
			self helperMethodFromFixture: #guardedHelper . 
			self helperMethodFromFixture: #notAHelper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testIncludesCallOnArguments [ 
	
	self analyzeMethodFromFixture: #testHelperOnArguments .
	
	self 
		assertCollection: visitor selfSentMethods 
		includesAll: { self helperMethodFromFixture: #helper } 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testIncludesGuardedMessages [

	| guardedMessages |
	self analyzeMethodFromFixture: #testHelper.
	guardedMessages := visitor guardedMessages methodMessages: (self helperMethodFromFixture: #testHelper).

	self assertCollection: guardedMessages hasSameElements: { #guardedHelper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testIncludesHelper [ 
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor helpers helpersOf: MaHelperFixture >> #testHelper ) 
		hasSameElements: { 
		self helperMethodFromFixture: #helper . 
		self helperMethodFromFixture: #guardedHelper } 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (visitor helpers helpersOf: MaHelperFixture >> #nestedHelper ) 
		hasSameElements: { self helperMethodFromFixture: #helper } 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testIncludesMessages [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor messages methodMessages: MaHelperFixture >> #testHelper)
		includesAll: { #helper . #foo . #ifTrue: . #notAHelper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testVisitorIsEmpty [
	
	self 
		assertEmpty: visitor methodsSelfCalls;
		assertEmpty: visitor guardedMessages methodsAnalyzed ;
		assertEmpty: visitor messages methodsAnalyzed;
		assertEmpty: visitor helpers helpers;
		assertEmpty: visitor guardedHelpers helpers
]

{ #category : 'tests' }
MaMethodVisitorTest >> testVisitsAreEqual [
	
	| newSelfCallFinder |
	self analyzeMethodFromFixture: #testHelper.
	newSelfCallFinder := MaMethodVisitor new 
		analyzeMethod: (self helperMethodFromFixture: #testHelper); 
		yourself.
	
	self 
		assert: visitor messages
		equals: newSelfCallFinder messages
]

{ #category : 'tests' }
MaMethodVisitorTest >> testVisitsSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assert: (visitor messages includes: MaHelperFixture >> #helper)
]
