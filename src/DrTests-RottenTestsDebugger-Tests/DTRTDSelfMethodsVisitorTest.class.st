"
A DTRTDSelfMethodsVisitorTest is a test class for testing the behavior of DTRTDSelfMethodsVisitor
"
Class {
	#name : 'DTRTDSelfMethodsVisitorTest',
	#superclass : 'DTRTDTestCaseVisitorTest',
	#category : 'DrTests-RottenTestsDebugger-Tests-Visitors',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Visitors'
}

{ #category : 'tests' }
DTRTDSelfMethodsVisitorTest >> testGraphMethodsAreFound [

	visitor visit: (AIGraphMatchingAlgorithmTest selector: #testCyclicNonWeightedSimple) .
	self
		assertCollection: (visitor methodVisitor methodsSelfCalls at: AIGraphMatchingAlgorithmTest >> #testCyclicNonWeightedSimple ) 
		hasSameElements: { AIGraphMatchingAlgorithmTest >> #testMaximumCardinalityIsAtMostPerfectForGraph: }
]

{ #category : 'factory' }
DTRTDSelfMethodsVisitorTest >> visitorClass [

	^ DTRTDSelfMethodsVisitor 
]
