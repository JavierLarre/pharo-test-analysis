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

	visitor := MaHelperVisitor new
		helperSelectors: #( assert: );
		yourself
]

{ #category : 'running' }
RTDHelperVisitorTest >> testEmpty [

	self 
		assertEmpty: visitor helpers
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelper [ 
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor helpers at: RTDVisitorFixture >> #testHelper ) 
		hasSameElements: { 
		self fixtureClass >> #helper . 
		self fixtureClass >> #guardedHelper } 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (visitor helpers at: RTDVisitorFixture >> #nestedHelper ) 
		hasSameElements: { self fixtureClass >> #helper } 
]
