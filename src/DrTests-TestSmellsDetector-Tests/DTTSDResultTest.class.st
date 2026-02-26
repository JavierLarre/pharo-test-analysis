"
A DTTSDResultTest is a test class for testing the behavior of DTTSDResult
"
Class {
	#name : 'DTTSDResultTest',
	#superclass : 'TestCase',
	#instVars : [
		'result'
	],
	#category : 'DrTests-TestSmellsDetector-Tests-Presenters',
	#package : 'DrTests-TestSmellsDetector-Tests',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDResultTest >> result [

	^ result ifNil: [
			  | tree |
			  tree := DTTSDPlugin new runForConfiguration: (DTPluginConfiguration items: { TSDFakeTests }).
			  result := tree buildTreeForUIOverwrittenSetup]
]

{ #category : 'tests' }
DTTSDResultTest >> testBuildTreeForUIOverwrittenSetup [

	self assert: (self result subResults first content selector) equals: #testConnectedToAssertion
]
