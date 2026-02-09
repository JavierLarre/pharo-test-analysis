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
	
	self visitor analyzeMethod: ( self fixtureClass >> aSelector )
]

{ #category : 'accessing' }
RTDMethodVisitorTest >> fixtureClass [

	^ RTDVisitorFixture
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testAnalyzeTwice [
	
	self 
		analyzeMethodFromFixture: #testHelper; 
		assertCollection: (self visitor methodsSelfCalls at: self fixtureClass >> #testHelper) 
			hasSameElements: { 
				self fixtureClass >> #helper . 
				self fixtureClass >> #guardedHelper . 
				self fixtureClass >> #notAHelper };
				
		analyzeMethodFromFixture: #testHelper; 
		assertCollection: (self visitor methodsSelfCalls at: self fixtureClass >> #testHelper) 
			hasSameElements: { 
				self fixtureClass >> #helper . 
				self fixtureClass >> #guardedHelper . 
				self fixtureClass >> #notAHelper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testCopy [
	
	| newSelfCallFinder |
	newSelfCallFinder := self visitor copy.
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		denyCollection: self visitor methodsSelfCalls 
		equals: newSelfCallFinder methodsSelfCalls 
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testEmpty [
	
	self 
		assertEmpty: self visitor methodsSelfCalls
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testEmptyMethods [
	
	self 
		analyzeMethodFromFixture: #testEmpty;
		denyCollection: self visitor methodsSelfCalls keys includesAny: { self fixtureClass >> #emptyMethod };
		assertEmpty: (self visitor methodsSelfCalls at: self fixtureClass >> #noMessages );
		
		analyzeMethodFromFixture: #emptyMethod;
		assert: (self visitor methodsSelfCalls includesKey: self fixtureClass >> #emptyMethod );
		assertEmpty: (self visitor methodsSelfCalls at: self fixtureClass >> #emptyMethod )
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testFindsMessagesSentToSelf [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (self visitor methodsSelfCalls at: self fixtureClass >> #testHelper)
		includesAll: { self fixtureClass >> #helper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testHasMethodSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (self visitor methodsSelfCalls at: self fixtureClass >> #testHelper) 
		hasSameElements: { 
			self fixtureClass >> #helper . 
			self fixtureClass >> #guardedHelper . 
			self fixtureClass >> #notAHelper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testIncludesCallOnArguments [ 
	
	self analyzeMethodFromFixture: #testHelperOnArguments .
	
	self 
		assertCollection: (self visitor methodsSelfCalls at: self fixtureClass >> #testHelperOnArguments)
		includesAll: { self fixtureClass >> #helper } 
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitCycle [

	self 
		analyzeMethodFromFixture: #testCycle;
		assertCollection: self visitor selfSentMethods 
		hasSameElements: { self fixtureClass >> #cycle1 . self fixtureClass >> #cycle2 }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitsAreEqual [
	
	| newSelfCallFinder |
	newSelfCallFinder := RTDMethodVisitor new 
		analyzeMethod: (self fixtureClass >> #testHelper); 
		yourself.
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assert: self visitor methodsSelfCalls 
		equals: newSelfCallFinder methodsSelfCalls 
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitsSelfCalls [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assert: (self visitor methodsSelfCalls includesKey: self fixtureClass >> #helper)
]

{ #category : 'accessing' }
RTDMethodVisitorTest >> visitor [

	^ visitor ifNil: [ visitor := self visitorClass new 
		selfClass: self fixtureClass; yourself ]
]

{ #category : 'accessing' }
RTDMethodVisitorTest >> visitorClass [

	^ RTDMethodVisitor 
]
