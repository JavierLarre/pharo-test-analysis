"
I am plugin implementing MethodMessageAnalyzer in DrTests
"
Class {
	#name : 'DTMaPlugin',
	#superclass : 'DrTestsPlugin',
	#category : 'DrTests-MethodMessagesAnalyzer-presenter',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'presenter'
}

{ #category : 'api - accessing' }
DTMaPlugin class >> pluginName [ 

	^ 'Method Message Analyzer'
]

{ #category : 'api - accessing' }
DTMaPlugin class >> pluginResultClass [ 
	
	^ DTMaResult 
]

{ #category : 'api - accessing' }
DTMaPlugin class >> weight [

	^ 10
]

{ #category : 'accessing' }
DTMaPlugin >> firstListLabel [
	^ 'Packages'
]

{ #category : 'accessing' }
DTMaPlugin >> pragmaForResultTrees [
	"Returns the selector of the pragma to gather result trees."
	^ 'dtTestMaResultTreeNamed:order:'
]

{ #category : 'api' }
DTMaPlugin >> resultButtonHelp [
	^ 'Browse the test selected in the results list.' translated
]

{ #category : 'api' }
DTMaPlugin >> runForConfiguration: aDTPluginConfiguration [

	^ self pluginResultClass new 
		viewModel: (DTMaWidget new 
			analyzeTestSuite: aDTPluginConfiguration asTestSuite);
		yourself
]

{ #category : 'accessing' }
DTMaPlugin >> secondListLabel [
	^ 'Tests Cases'
]

{ #category : 'api' }
DTMaPlugin >> startButtonHelp [
	^ 'Analyze Tests' translated
]

{ #category : 'api' }
DTMaPlugin >> startButtonLabel [
	^ 'Analyze tests selected.' translated
]
