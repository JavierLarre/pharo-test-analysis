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

	^ DTTSDMultipleResultBuilder builders: { DTTSDAssertionlessBuilder . DTTSDOverwrittenSetupBuilder }
]

{ #category : 'accessing' }
DTTSDPlugin >> detector [

	^ detector ifNil: [ detector := TSDAssertionLessDetector new
		  methodVisitor: RTDHelperVisitor withAssertableSelectors;
		  yourself ]
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
	result := self pluginResultClass new.
	self builder buildResult: result withTests: aDTpluginConfiguration asTestSuite tests.
	^ result
]

{ #category : 'api' }
DTTSDPlugin >> startButtonHelp [ 

	^ 'Detect smells' translated 
]

{ #category : 'api' }
DTTSDPlugin >> startButtonLabel [ 

	^ 'Detect smells in tests selected.' translated 
]

{ #category : 'tests' }
DTTSDPlugin >> testCaseMethod: aTestCase [

	^ (aTestCase class lookupSelector: aTestCase selector )
		ifNil: [ Error signal: 'test method not found' ]
]
