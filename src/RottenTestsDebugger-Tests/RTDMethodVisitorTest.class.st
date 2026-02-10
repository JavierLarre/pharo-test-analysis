Class {
	#name : 'RTDMethodVisitorTest',
	#superclass : 'RTDVisitorTest',
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'tests' }
RTDMethodVisitorTest >> testAnalyzeTwice [
	
	self 
		analyzeMethodFromFixture: #testHelper; 
		assertAt: #testHelper hasMethods: { #helper. #guardedHelper. #notAHelper };
				
		analyzeMethodFromFixture: #testHelper; 
		assertAt: #testHelper hasMethods: { #helper. #guardedHelper. #notAHelper }
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
RTDMethodVisitorTest >> testEmptyMethods [
	
	self 
		analyzeMethodFromFixture: #testEmpty;
		denyCollection: self visitor methodsSelfCalls keys includesAny: { self fixtureClass >> #emptyMethod };
		assertEmpty: (self methodsAt: #noMessages );
		
		analyzeMethodFromFixture: #emptyMethod;
		assert: (self visitor methodsSelfCalls includesKey: self fixtureClass >> #emptyMethod );
		assertEmpty: (self methodsAt: #emptyMethod )
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testFindsMessagesSentToSelf [

	self analyzeMethodFromFixture: #testHelper.

	self assertCollection: (self methodsAt: #testHelper) includesAll: { (self fixtureClass >> #helper) }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testHasCorrectCalls [

	self analyzeMethodFromFixture: #testBigHelper.

	self
		assertAt: #testBigHelper hasMethods: { #bigHelper };
		assertAt: #bigHelper hasMethods: { 
			#helper0 . #helper1 . #noMessages . #helper2 . #guardedHelper . #notAHelper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testHasMethodSelfCalls [

	self analyzeMethodFromFixture: #testHelper.
	self assertAt: #testHelper hasMethods: #( helper guardedHelper notAHelper )
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testHasRepeatedSelfCalls [

	self analyzeMethodFromFixture: #testRepeatedHelper.

	self assertAt: #testRepeatedHelper hasMethods: { #helper }
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testIncludesCallOnArguments [

	self analyzeMethodFromFixture: #testHelperOnArguments.

	self 
		assertCollection: (self methodsAt: #testHelperOnArguments) 
		includesAll: (self fixtureMethodsFrom: { #helper })
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testTwoMethodsShareSelfCalls [

	
	self 
		analyzeMethodFromFixture: #testHelper;
		analyzeMethodFromFixture: #nestedHelper;
		assertAt: #testHelper hasMethods: #( helper guardedHelper notAHelper );
		assertAt: #nestedHelper hasMethods: #( helper )
]

{ #category : 'tests' }
RTDMethodVisitorTest >> testVisitCycle [

	self 
		analyzeMethodFromFixture: #testCycle;
		assertCollection: self visitor selfSentMethods 
		hasSameElements: (self fixtureMethodsFrom: { #cycle1 . #cycle2 })
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
RTDMethodVisitorTest >> visitorClass [ 

	^ RTDMethodVisitor 
]

{ #category : 'accessing' }
RTDMethodVisitorTest >> visitorMethods [ 
	
	^ self visitor methodsSelfCalls 
]
