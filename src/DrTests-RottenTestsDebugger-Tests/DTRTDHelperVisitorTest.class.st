"
A DTRTDHelperVisitorTest is a test class for testing the behavior of DTRTDHelperVisitor
"
Class {
	#name : 'DTRTDHelperVisitorTest',
	#superclass : 'DTRTDTestCaseVisitorTest',
	#category : 'DrTests-RottenTestsDebugger-Tests-Visitors',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Visitors'
}

{ #category : 'tests' }
DTRTDHelperVisitorTest >> testGraphHelpersAreFound [

	visitor visit: (AIGraphMatchingAlgorithmTest selector: #testCyclicNonWeightedComplex). 
	
	self 
		denyEmpty: (visitor methodVisitor helpers at: AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedComplex).
	visitor visit: (AIGraphMatchingAlgorithmTest selector: #testCyclicNonWeightedSimple). 
	
	self 
		denyEmpty: (visitor methodVisitor helpers at: AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedSimple).
]

{ #category : 'tests' }
DTRTDHelperVisitorTest >> testHelpersAreFound [

	
	self
		visitClass: self fixtureClass; 
		assertCollection: viewModel helpers first messages hasSameElements: { #helper }
]

{ #category : 'tests' }
DTRTDHelperVisitorTest >> testInheritedTestsAreFound [

	self 
		visitClass: self subFixtureClass;
		assertCollection: viewModel helpers first messages hasSameElements: { #helper }
]

{ #category : 'factory' }
DTRTDHelperVisitorTest >> visitorClass [

	^ DTRTDHelperVisitor 
]
