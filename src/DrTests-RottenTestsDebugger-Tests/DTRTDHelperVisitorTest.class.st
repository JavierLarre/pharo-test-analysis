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

{ #category : 'accessing' }
DTRTDHelperVisitorTest >> methodViewModels [ 

	^ viewModel helpers 
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

{ #category : 'tests' }
DTRTDHelperVisitorTest >> testSharedHelpersAreFound [

	self visitClass: self fixtureClass . 
	
	self 
		denyEmpty: (self methodModelFrom: self fixtureClass >> #testMethod) messages;
		denyEmpty: (self methodModelFrom: self fixtureClass >> #testHelper) messages.
]

{ #category : 'factory' }
DTRTDHelperVisitorTest >> visitorClass [

	^ DTRTDHelperVisitor 
]
