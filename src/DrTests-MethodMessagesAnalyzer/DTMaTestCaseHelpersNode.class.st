"
I am a DrTestTreeNode for displaying the helper methods of a test case
"
Class {
	#name : 'DTMaTestCaseHelpersNode',
	#superclass : 'DTMaTestCaseNode',
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'accessing' }
DTMaTestCaseHelpersNode >> messages: aTestCaseMessages [

	super messages: aTestCaseMessages .
	self subResults do: [ :messageNode | messageNode browseMethod: aTestCaseMessages testCase class >> messageNode message ]
]
