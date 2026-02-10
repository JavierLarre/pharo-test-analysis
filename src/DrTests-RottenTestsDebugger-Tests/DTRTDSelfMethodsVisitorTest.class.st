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

{ #category : 'accessing' }
DTRTDSelfMethodsVisitorTest >> methodViewModels [ 

	^ viewModel selfSentMethods 
]

{ #category : 'factory' }
DTRTDSelfMethodsVisitorTest >> visitorClass [

	^ DTRTDSelfMethodsVisitor 
]
