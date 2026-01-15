Class {
	#name : 'MaMethodVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'utilities' }
MaMethodVisitorTest >> analyzeMethodFromFixture: aSelector [
	
	visitor analyzeMethod: ( self fixtureMethod: aSelector )
]

{ #category : 'utilities' }
MaMethodVisitorTest >> fixtureMethod: aSelector [
	
	^MaVisitorFixture >> aSelector 
]

{ #category : 'running' }
MaMethodVisitorTest >> setUp [
	super setUp.
	visitor := MaMethodVisitor new.
	MaVisitorFixture superclass: TestCase 
]

{ #category : 'running' }
MaMethodVisitorTest >> tearDown [ 
	MaVisitorFixture superclass: Object.
	super tearDown 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testEmpty [
	
	self 
		assertEmpty: visitor methodsSelfCalls
]

{ #category : 'tests' }
MaMethodVisitorTest >> testFindsMessagesSentToSelf [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self fixtureMethod: #testHelper))
		includesAll: { self fixtureMethod: #helper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testHasMethodSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self fixtureMethod: #testHelper)) 
		hasSameElements: { 
			self fixtureMethod: #helper . 
			self fixtureMethod: #guardedHelper . 
			self fixtureMethod: #notAHelper }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testIncludesCallOnArguments [ 
	
	self analyzeMethodFromFixture: #testHelperOnArguments .
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self fixtureMethod: #testHelperOnArguments))
		includesAll: { self fixtureMethod: #helper } 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testVisitCycle [

	self 
		analyzeMethodFromFixture: #testCycle;
		assertCollection: visitor selfSentMethods hasSameElements: { self fixtureMethod: #cycle1 . self fixtureMethod: #cycle2 }
]

{ #category : 'tests' }
MaMethodVisitorTest >> testVisitsAreEqual [
	
	| newSelfCallFinder |
	self analyzeMethodFromFixture: #testHelper.
	newSelfCallFinder := MaMethodVisitor new 
		analyzeMethod: (self fixtureMethod: #testHelper); 
		yourself.
	
	self 
		assert: visitor methodsSelfCalls 
		equals: newSelfCallFinder methodsSelfCalls 
]

{ #category : 'tests' }
MaMethodVisitorTest >> testVisitsSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assert: (visitor methodsSelfCalls includesKey: MaVisitorFixture >> #helper)
]
