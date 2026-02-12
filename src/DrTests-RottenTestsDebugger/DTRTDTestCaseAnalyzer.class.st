"
I analyze test case with the given strategy and build the method data accordingly
"
Class {
	#name : 'DTRTDTestCaseAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'methodDatas',
		'analysisStrategy'
	],
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> analysisStrategy [

	^ analysisStrategy ifNil: [ Error signal: 'strategy not given' ] 
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> analysisStrategy: anObject [

	analysisStrategy := anObject
]

{ #category : 'visiting' }
DTRTDTestCaseAnalyzer >> analyzeTestCase: aTestCase [

	self analysisStrategy analyzeTestCase: aTestCase.
]

{ #category : 'building' }
DTRTDTestCaseAnalyzer >> buildViewModel: viewModel [

	self analysisStrategy buildViewModel: viewModel 
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> methodDatas [

	^ methodDatas ifNil: [ methodDatas := OrderedCollection new ]
]
