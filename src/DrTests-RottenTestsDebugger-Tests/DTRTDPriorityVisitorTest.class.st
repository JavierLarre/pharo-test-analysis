"
A DTRTDPriorityVisitorTest is a test class for testing the behavior of DTRTDPriorityVisitor
"
Class {
	#name : 'DTRTDPriorityVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor',
		'viewModel'
	],
	#category : 'DrTests-RottenTestsDebugger-Tests-Visitors',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Visitors'
}

{ #category : 'running' }
DTRTDPriorityVisitorTest >> setUp [
	super setUp.

	DTRTDFixture superclass: TestCase.
]

{ #category : 'running' }
DTRTDPriorityVisitorTest >> tearDown [

	DTRTDFixture superclass: Object.
	super tearDown
]

{ #category : 'tests' }
DTRTDPriorityVisitorTest >> testEmptyMethodsAreIgnored [

	viewModel := DTRTDViewModel new.
	visitor := RTDMethodVisitor new.
	visitor 
		analyzeMethod: DTRTDFixture >> #testMethod.
	self
		assert: (visitor methodsSelfCalls includesKey: DTRTDFixture >> #emptyMethod)
]
