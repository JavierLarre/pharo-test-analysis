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
DTRTDHelperVisitorTest >> testHelpersAreFound [

	self assertCollection: viewModel helpers first messages hasSameElements: { #helper }
]

{ #category : 'tests' }
DTRTDHelperVisitorTest >> testSubclassHelpersAreFound [

	visitor visit: (TestSuite new 
		addTest: DTRTDFixture suite;
		yourself).
	self assertCollection: viewModel helpers hasSameElements: { DTRTDFixture >> #testMethod }
]

{ #category : 'factory' }
DTRTDHelperVisitorTest >> visitorClass [

	^ DTRTDHelperVisitor 
]
