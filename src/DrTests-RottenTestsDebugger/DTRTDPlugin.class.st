"
I am plugin implementing MethodMessageAnalyzer in DrTests
"
Class {
	#name : 'DTRTDPlugin',
	#superclass : 'DrTestsPlugin',
	#category : 'DrTests-RottenTestsDebugger-Presenters',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Presenters'
}

{ #category : 'api - accessing' }
DTRTDPlugin class >> pluginName [ 

	^ 'Rotten Tests Debugger'
]

{ #category : 'api - accessing' }
DTRTDPlugin class >> pluginResultClass [ 
	
	^ DTRTDResult 
]

{ #category : 'api - accessing' }
DTRTDPlugin class >> weight [

	^ 10
]

{ #category : 'building' }
DTRTDPlugin >> buildViewModelFrom: aTestSuite [

	| viewModel visitors |
	viewModel := self viewModelClass new.
	visitors := self testVisitors collect: #new.
	aTestSuite tests do: [ :aTestCase |
				visitors do: [ :visitor | visitor visitTestCase: aTestCase ] ].
	visitors do: [ :visitor | visitor visitTestSuite: aTestSuite; buildViewModel: viewModel ].
	^ viewModel
]

{ #category : 'accessing' }
DTRTDPlugin >> firstListLabel [
	^ 'Packages'
]

{ #category : 'accessing' }
DTRTDPlugin >> pragmaForResultTrees [
	"Returns the selector of the pragma to gather result trees."
	^ 'dtTestRTDResultTreeNamed:order:'
]

{ #category : 'api' }
DTRTDPlugin >> resultButtonHelp [
	^ 'Browse the test selected in the results list.' translated
]

{ #category : 'api' }
DTRTDPlugin >> runForConfiguration: aDTPluginConfiguration [

	^ self pluginResultClass new 
		viewModel: (self buildViewModelFrom: aDTPluginConfiguration asTestSuite);
		yourself
]

{ #category : 'accessing' }
DTRTDPlugin >> secondListLabel [
	^ 'Tests Cases'
]

{ #category : 'api' }
DTRTDPlugin >> startButtonHelp [
	^ 'Analyze Tests' translated
]

{ #category : 'api' }
DTRTDPlugin >> startButtonLabel [
	^ 'Analyze tests selected.' translated
]

{ #category : 'accessing' }
DTRTDPlugin >> testVisitors [

	^ {
		  DTRTDHelperVisitor.
		  DTRTDMessagesVisitor.
		  DTRTDSelfMethodsVisitor.
		  DTRTDFirstFixVisitor }
]

{ #category : 'accessing' }
DTRTDPlugin >> viewModelClass [

	^ DTRTDViewModel
]
