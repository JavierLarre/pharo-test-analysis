"
A MaHelperVisitorTest is a test class for testing the behavior of MaHelperVisitor
"
Class {
	#name : 'RTDHelperVisitorTest',
	#superclass : 'RTDMethodVisitorTest',
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'running' }
RTDHelperVisitorTest >> setUp [
	super setUp.

	visitor := RTDHelperVisitor new
		helperSelectors: #( assert: );
		yourself
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testEmpty [

	self 
		assertEmpty: visitor helpers
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelper [ 
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor helpers at: self fixtureClass >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper } 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (visitor helpers at: self fixtureClass >> #nestedHelper ) 
		hasSameElements: { self fixtureClass >> #helper } 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperTwice [
	
	self 
		analyzeMethodFromFixture: #testHelper;
		
		assertCollection: (visitor helpers at: self fixtureClass >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper };
		
		analyzeMethodFromFixture: #testHelper;
		assertCollection: (visitor helpers at: self fixtureClass >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper }
]
