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

{ #category : 'testing' }
DTRTDTestCaseVisitorTest class >> isAbstract [ 

	^ self = DTRTDTestCaseVisitorTest 
]

{ #category : 'testing' }
DTRTDTestCaseVisitorTest class >> shouldInheritSelectors [

	^ true
]

{ #category : 'accessing' }
DTRTDTestCaseVisitorTest >> fixtureClass [

	^ DTRTDFixture
]

{ #category : 'accessing' }
DTRTDTestCaseVisitorTest >> methodModelFrom: aCompiledMethod [

	^ self methodViewModels detect: [ :methodViewModel | methodViewModel compiledMethod = aCompiledMethod ] 
]

{ #category : 'accessing' }
DTRTDTestCaseVisitorTest >> methodViewModels [ 

	^ self subclassResponsibility 
]

{ #category : 'running' }
DTRTDTestCaseVisitorTest >> setUp [
	super setUp.

	self fixtureClass superclass: TestCase.
	viewModel := DTRTDViewModel new.
	visitor := self visitorClass new
]

{ #category : 'accessing' }
DTRTDTestCaseVisitorTest >> subFixtureClass [ 

	^ DTRTDSubFixture 
]

{ #category : 'running' }
DTRTDTestCaseVisitorTest >> tearDown [

	self fixtureClass superclass: Object.
	super tearDown
]

{ #category : 'visiting' }
DTRTDTestCaseVisitorTest >> visitClass: aTestClass [

	^ visitor 
		visit: aTestClass suite;
		buildViewModel: viewModel 
]

{ #category : 'factory' }
DTRTDTestCaseVisitorTest >> visitorClass [

	^ self subclassResponsibility 
]
