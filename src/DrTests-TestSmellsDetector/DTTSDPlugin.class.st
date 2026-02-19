"
I am the plugin implementing smell detectors for DrTest
"
Class {
	#name : 'DTTSDPlugin',
	#superclass : 'DrTestsPlugin',
	#instVars : [
		'detector'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'api - accessing' }
DTTSDPlugin class >> pluginName [ 

	^ 'Test Smells Detector'
]

{ #category : 'api - accessing' }
DTTSDPlugin class >> pluginResultClass [ 

	^ DTTSDResult 
]

{ #category : 'api - accessing' }
DTTSDPlugin class >> weight [
	^11
]

{ #category : 'accessing' }
DTTSDPlugin >> builder [

	^ DTTSDMultipleResultBuilder builders: {
			  DTTSDDetectorBuilder assertionless.
			  DTTSDDetectorBuilder overwrittenSetup.
			  DTTSDDetectorBuilder classReferences.
			  DTTSDDetectorBuilder uselessSetup }
]

{ #category : 'accessing' }
DTTSDPlugin >> pragmaForResultTrees [

	^ 'dtTestTSDResultTreeNamed:order:' 
]

{ #category : 'api' }
DTTSDPlugin >> resultButtonHelp [
	
	^ 'Browse the test selected in the results list.' translated
]

{ #category : 'api' }
DTTSDPlugin >> runForConfiguration: aDTpluginConfiguration [

	| result |
	result := DTTSDTestData new.
	self builder buildData: result withTests: aDTpluginConfiguration asTestSuite tests.
	^ self pluginResultClass new testData: result; yourself
]

{ #category : 'api' }
DTTSDPlugin >> startButtonHelp [ 

	^ 'Detect smells' translated 
]

{ #category : 'api' }
DTTSDPlugin >> startButtonLabel [ 

	^ 'Detect smells in tests selected.' translated 
]
