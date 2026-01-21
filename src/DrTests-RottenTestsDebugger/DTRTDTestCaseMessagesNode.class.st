"
I am a DrTestTreeLeaf for displaying the messages of a test case
"
Class {
	#name : 'DTRTDTestCaseMessagesNode',
	#superclass : 'DTRTDTestCaseNode',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'accessing' }
DTRTDTestCaseMessagesNode >> messages: aTestCaseMessages [

	super messages: aTestCaseMessages.
	subResults do: [ :messageNode | 
		messageNode browseMethod: aTestCaseMessages testMethod ]
]
