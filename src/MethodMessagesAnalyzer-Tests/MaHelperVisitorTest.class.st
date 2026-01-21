"
A MaHelperVisitorTest is a test class for testing the behavior of MaHelperVisitor
"
Class {
	#name : 'MaHelperVisitorTest',
	#superclass : 'MaMethodVisitorTest',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaHelperVisitorTest >> setUp [
	super setUp.

	visitor := MaHelperVisitor new
		helperSelectors: #( assert: );
		yourself
]

{ #category : 'running' }
MaHelperVisitorTest >> testEmpty [

	self 
		assertEmpty: visitor helpers helpers
]

{ #category : 'tests' }
MaHelperVisitorTest >> testIncludesHelper [ 
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor helpers atMethod: MaVisitorFixture >> #testHelper ) 
		hasSameElements: { 
		self fixtureMethod: #helper . 
		self fixtureMethod: #guardedHelper } 
]

{ #category : 'tests' }
MaHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (visitor helpers atMethod: MaVisitorFixture >> #nestedHelper ) 
		hasSameElements: { self fixtureMethod: #helper } 
]
