Class {
	#name : 'RTDMethodVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'utilities' }
RTDMethodVisitorTest >> analyzeMethodFromFixture: aSelector [
	
	visitor analyzeMethod: ( self fixtureMethod: aSelector )
]

{ #category : 'utilities' }
RTDMethodVisitorTest >> fixtureMethod: aSelector [
	
	^RTDVisitorFixture >> aSelector 
]

{ #category : 'running' }
RTDMethodVisitorTest >> setUp [
	super setUp.
	visitor := RTDMethodVisitor new.
	RTDVisitorFixture superclass: TestCase 
]

{ #category : 'running' }
RTDMethodVisitorTest >> tearDown [ 
	RTDVisitorFixture superclass: Object.
	super tearDown 
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testEmpty [
	
	self 
		assertEmpty: visitor methodsSelfCalls
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testFindsMessagesSentToSelf [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self fixtureMethod: #testHelper))
		includesAll: { self fixtureMethod: #helper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testHasMethodSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self fixtureMethod: #testHelper)) 
		hasSameElements: { 
			self fixtureMethod: #helper . 
			self fixtureMethod: #guardedHelper . 
			self fixtureMethod: #notAHelper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testIncludesCallOnArguments [ 
	
	self analyzeMethodFromFixture: #testHelperOnArguments .
	
	self 
		assertCollection: (visitor methodsSelfCalls at: (self fixtureMethod: #testHelperOnArguments))
		includesAll: { self fixtureMethod: #helper } 
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitCycle [

	self 
		analyzeMethodFromFixture: #testCycle;
		assertCollection: visitor selfSentMethods hasSameElements: { self fixtureMethod: #cycle1 . self fixtureMethod: #cycle2 }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitsAreEqual [
	
	| newSelfCallFinder |
	self analyzeMethodFromFixture: #testHelper.
	newSelfCallFinder := RTDMethodVisitor new 
		analyzeMethod: (self fixtureMethod: #testHelper); 
		yourself.
	
	self 
		assert: visitor methodsSelfCalls 
		equals: newSelfCallFinder methodsSelfCalls 
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitsSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assert: (visitor methodsSelfCalls includesKey: RTDVisitorFixture >> #helper)
]
