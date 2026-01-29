Class {
	#name : 'DTRTDTestCaseVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor',
		'viewModel'
	],
	#category : 'DrTests-RottenTestsDebugger-Tests-Visitors',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Visitors'
}

{ #category : 'accessing' }
DTRTDTestCaseVisitorTest >> fixtureClass [

	^ DTRTDFixture
]

{ #category : 'running' }
DTRTDTestCaseVisitorTest >> setUp [
	super setUp.

	self fixtureClass superclass: TestCase.
	viewModel := DTRTDViewModel new.
	visitor := self visitorClass new
		visit: self fixtureClass suite;
		buildViewModel: viewModel;
		yourself.
]

{ #category : 'running' }
DTRTDTestCaseVisitorTest >> tearDown [

	self fixtureClass superclass: Object.
	super tearDown
]

{ #category : 'factory' }
DTRTDTestCaseVisitorTest >> visitorClass [

	^ self subclassResponsibility 
]
