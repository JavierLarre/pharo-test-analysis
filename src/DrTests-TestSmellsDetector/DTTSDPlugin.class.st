Class {
	#name : 'DTTSDPlugin',
	#superclass : 'DrTestsPlugin',
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

{ #category : 'api' }
DTTSDPlugin >> pluginName [ 

	^ 'Test Smell Detector'
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
	
	| detector |
	detector := TSDAssertionLessDetector new 
			methodVisitor: (RTDHelperVisitor new
				helperSelectors: (TAssertable selectors union: { #assert:. #assert:description: });
				yourself); 
			yourself.
	^ self pluginResultClass new
		assertionlessTests: (aDTpluginConfiguration asTestSuite tests select: [ :aTestCase | 
			detector isAssertionLess: (self testCaseMethod: aTestCase ) ] );
		yourself
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
