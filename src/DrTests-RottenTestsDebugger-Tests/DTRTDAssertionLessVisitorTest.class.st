"
A DTRTDAssertionLessVisitorTest is a test class for testing the behavior of DTRTDAssertionLessVisitor
"
Class {
	#name : 'DTRTDAssertionLessVisitorTest',
	#superclass : 'DTRTDTestCaseVisitorTest',
	#category : 'DrTests-RottenTestsDebugger-Tests-Visitors',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Visitors'
}

{ #category : 'tests' }
DTRTDAssertionLessVisitorTest >> testAssertionIsIgnored [
	
	self
		visitClass: self fixtureClass; 
		denyCollection: (viewModel assertionlessTests collect: #compiledMethod) 
			includesAny: { self fixtureClass >> #testMethod }
]

{ #category : 'tests' }
DTRTDAssertionLessVisitorTest >> testAssertionLessIsFound [

	
	self
		visitClass: self fixtureClass; 
		assert: viewModel assertionlessTests first compiledMethod equals: self fixtureClass >> #testAssertionLess 
]

{ #category : 'tests' }
DTRTDAssertionLessVisitorTest >> testConnectedAssertionIsIgnored [

	self
		deny: (visitor detector isAssertionLess: self fixtureClass >> #testHelper) ;
		visitClass: self fixtureClass; 
		denyCollection: (viewModel assertionlessTests collect: #compiledMethod) 
			includesAny: { self fixtureClass >> #testHelper }
]

{ #category : 'tests' }
DTRTDAssertionLessVisitorTest >> testConnectedAssertionIsIgnoredGraph [

	self
		deny: (visitor detector isAssertionLess: AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedSimple) ;
		visitClass: AIGraphMatchingAlgorithmTest; 
		denyCollection: (viewModel assertionlessTests collect: #compiledMethod) 
			includesAny: { AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedSimple }
]

{ #category : 'tests' }
DTRTDAssertionLessVisitorTest >> testDetectorIgnoresAssertion [

	self
		deny: (visitor detector isAssertionLess: self fixtureClass >> #testMethod)
]

{ #category : 'tests' }
DTRTDAssertionLessVisitorTest >> testHelperIsIgnored [

	self
		deny: (visitor detector isAssertionLess: self fixtureClass >> #testHelper);
		deny: (visitor detector isAssertionLess: self fixtureClass >> #testHelper)
]

{ #category : 'factory' }
DTRTDAssertionLessVisitorTest >> visitorClass [

	^ DTRTDAssertionLessVisitor 
]
