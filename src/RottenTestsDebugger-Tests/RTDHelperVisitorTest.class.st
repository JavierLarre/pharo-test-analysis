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
		assertCollection: (visitor helpers atMethod: RTDVisitorFixture >> #testHelper ) 
		hasSameElements: { 
		self fixtureMethod: #helper . 
		self fixtureMethod: #guardedHelper } 
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (visitor helpers atMethod: RTDVisitorFixture >> #nestedHelper ) 
		hasSameElements: { self fixtureMethod: #helper } 
]
