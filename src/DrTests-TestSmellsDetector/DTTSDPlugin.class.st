Class {
	#name : 'DTTSDPlugin',
	#superclass : 'DTRTDPlugin',
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
DTTSDPlugin >> startButtonHelp [ 

	^ 'Detect smells' translated 
]

{ #category : 'api' }
DTTSDPlugin >> startButtonLabel [ 

	^ 'Detect smells in tests selected.' translated 
]

{ #category : 'api' }
DTTSDPlugin >> testVisitors [ 

	^ { DTTSDAssertionLessVisitor }
]

{ #category : 'as yet unclassified' }
DTTSDPlugin >> viewModelClass [ 

	^ DTTSDViewModel 
]
