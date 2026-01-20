"
I am a DrTestTreeLeaf for displaying the messages of a test case
"
Class {
	#name : 'DTMaTestCaseMessagesNode',
	#superclass : 'DTMaTestCaseNode',
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'accessing' }
DTMaTestCaseMessagesNode >> messages: aTestCaseMessages [

	super messages: aTestCaseMessages.
	self subResults do: [ :messageNode | messageNode browseMethod: aTestCaseMessages testMethod ]
]
