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

{ #category : 'utilities' }
DTRTDPriorityVisitorTest >> fixtureClass [

	^ DTRTDFixture
]

{ #category : 'utilities' }
DTRTDPriorityVisitorTest >> priorityTestCase: aSelector [

	^ viewModel testCasesPriorities detect: [ :priorityTestCase | 
		priorityTestCase testMethod = (self fixtureClass >> aSelector ) ]
]

{ #category : 'running' }
DTRTDPriorityVisitorTest >> setUp [
	super setUp.

	DTRTDFixture superclass: TestCase.
	viewModel := DTRTDViewModel new.
	visitor := DTRTDPriorityVisitor new
		visit: self fixtureClass suite;
		buildViewModel: viewModel;
		yourself.
]

{ #category : 'running' }
DTRTDPriorityVisitorTest >> tearDown [

	DTRTDFixture superclass: Object.
	super tearDown
]

{ #category : 'tests' }
DTRTDPriorityVisitorTest >> testEmptyMethodsAreIgnored [

	| emptyMethod |
	emptyMethod := self fixtureClass >> #emptyMethod.
	self
		deny: ((self priorityTestCase: #testMethod) higherPriorityCases anySatisfy: [ :testCaseViewModel |
			testCaseViewModel testMethod = emptyMethod ])
]
