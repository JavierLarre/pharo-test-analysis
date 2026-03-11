"
I am plugin implementing MethodMessageAnalyzer in DrTests
"
Class {
	#name : 'DTFTFPlugin',
	#superclass : 'DrTestsPlugin',
	#category : 'DrTests-FirstToFix-Presenters',
	#package : 'DrTests-FirstToFix',
	#tag : 'Presenters'
}

{ #category : 'api - accessing' }
DTFTFPlugin class >> pluginName [

	^ 'First-to-fix tests'
]

{ #category : 'api - accessing' }
DTFTFPlugin class >> pluginResultClass [ 
	
	^ DTFTFResult 
]

{ #category : 'api - accessing' }
DTFTFPlugin class >> weight [

	^ 10
]

{ #category : 'building' }
DTFTFPlugin >> buildViewModelFrom: aTestSuite [

	| viewModel testVisitor |
	viewModel := DTFTFViewModel new.
	testVisitor := DTFTFFirstFixVisitor new.
	aTestSuite tests do: [ :aTestCase | testVisitor analyzeTestCase: aTestCase ].
	testVisitor buildViewModel: viewModel.
	^ viewModel
]

{ #category : 'accessing' }
DTFTFPlugin >> firstListLabel [
	^ 'Packages'
]

{ #category : 'accessing' }
DTFTFPlugin >> pragmaForResultTrees [
	"Returns the selector of the pragma to gather result trees."
	^ 'dtTestFTFResultTreeNamed:order:'
]

{ #category : 'api' }
DTFTFPlugin >> resultButtonHelp [
	^ 'Browse the test selected in the results list.' translated
]

{ #category : 'api' }
DTFTFPlugin >> runForConfiguration: aDTPluginConfiguration [

	^ self pluginResultClass new 
		viewModel: (self buildViewModelFrom: aDTPluginConfiguration asTestSuite);
		yourself
]

{ #category : 'accessing' }
DTFTFPlugin >> secondListLabel [
	^ 'Tests Cases'
]

{ #category : 'api' }
DTFTFPlugin >> startButtonHelp [
	^ 'Sort Tests' translated
]

{ #category : 'api' }
DTFTFPlugin >> startButtonLabel [
	^ 'Sort tests selected.' translated
]
