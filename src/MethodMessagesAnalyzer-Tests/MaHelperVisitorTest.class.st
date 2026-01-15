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
]

{ #category : 'running' }
MaHelperVisitorTest >> testEmpty [

	self 
		assertEmpty: visitor helpers helpers;
		assertEmpty: visitor guardedHelpers helpers
]

{ #category : 'tests' }
MaHelperVisitorTest >> testHelperWithVariable [ 
	
	self 
		skip: 'not my priority right now';
		analyzeMethodFromFixture: #testHelperWithVariable;
		deny: (visitor guardedHelpers 
					atMethod: (self fixtureMethod: #testHelperWithVariable ) 
					includesHelper: (self fixtureMethod: #helper ))
]

{ #category : 'tests' }
MaHelperVisitorTest >> testIncludesHelper [ 
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor helpers helpersOf: MaHelperFixture >> #testHelper ) 
		hasSameElements: { 
		self fixtureMethod: #helper . 
		self fixtureMethod: #guardedHelper } 
]

{ #category : 'tests' }
MaHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [
	
	self analyzeMethodFromFixture: #testNested.
	
	self 
		assertCollection: (visitor helpers helpersOf: MaHelperFixture >> #nestedHelper ) 
		hasSameElements: { self fixtureMethod: #helper } 
]
