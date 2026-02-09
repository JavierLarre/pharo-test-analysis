"
A MaHelperVisitorTest is a test class for testing the behavior of MaHelperVisitor
"
Class {
	#name : 'RTDHelperVisitorTest',
	#superclass : 'RTDVisitorTest',
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'tests' }
RTDHelperVisitorTest >> testEmpty [

	self 
		assertEmpty: self visitor helpers
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelper [ 
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (self visitor helpers at: self fixtureClass >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper } 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (self visitor helpers at: self fixtureClass >> #nestedHelper ) 
		hasSameElements: { self fixtureClass >> #helper } 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperGraph [
	
	self visitor analyzeMethod: AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedSimple.
	
	self 
		denyEmpty: (self visitor helpers at: AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedSimple ) 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperTwice [
	
	self 
		analyzeMethodFromFixture: #testHelper;
		
		assertCollection: (self visitor helpers at: self fixtureClass >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper };
		
		analyzeMethodFromFixture: #testHelper;
		assertCollection: (self visitor helpers at: self fixtureClass >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper }
]

{ #category : 'accessing' }
RTDHelperVisitorTest >> visitor [

	^ visitor ifNil: [ super visitor  
		helperSelectors: #( assert: ); yourself ]
]

{ #category : 'accessing' }
RTDHelperVisitorTest >> visitorClass [

	^ RTDHelperVisitor 
]
