"
I am a DrTestTreeNode for displaying the helper methods of a test case
"
Class {
	#name : 'DTRTDTestCaseHelpersNode',
	#superclass : 'DTRTDTestCaseNode',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'accessing' }
DTRTDTestCaseHelpersNode >> messages: aTestCaseMessages [

	super messages: aTestCaseMessages .
	subResults do: [ :messageNode | 
		messageNode browseMethod: aTestCaseMessages testCase class >> messageNode message ]
]
