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
RTDHelperVisitorTest >> testIncludesHelper [

	self analyzeMethodFromFixture: #testHelper.
	self assertAt: #testHelper hasMethods: {
			#helper.
			#guardedHelper }
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperFromOtherSelfCalls [

	self analyzeMethodFromFixture: #testNested.
	self assertAt: #nestedHelper hasMethods: { #helper }
]

{ #category : 'tests' }
RTDHelperVisitorTest >> testIncludesHelperTwice [

	self
		analyzeMethodFromFixture: #testHelper;
		assertAt: #testHelper hasMethods: { #helper. #guardedHelper };
		analyzeMethodFromFixture: #testHelper;
		assertAt: #testHelper hasMethods: { #helper. #guardedHelper }
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

{ #category : 'accessing' }
RTDHelperVisitorTest >> visitorMethods [ 

	^ self visitor helpers 
]
