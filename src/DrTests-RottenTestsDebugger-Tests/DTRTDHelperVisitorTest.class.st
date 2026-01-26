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

	| helperVisitor testMethod |
	helperVisitor := RTDHelperVisitor new
		helperSelectors: {#assert:};
		yourself.
	testMethod := self fixtureClass >> #testMethod.
	helperVisitor analyzeMethod: testMethod.
	self assert: (helperVisitor helpers at: testMethod) isNotEmpty
]

{ #category : 'factory' }
DTRTDHelperVisitorTest >> visitorClass [

	^ DTRTDHelperVisitor 
]
