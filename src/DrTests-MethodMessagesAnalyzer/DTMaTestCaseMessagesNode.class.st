"
I am a DrTestTreeLeaf for displaying the messages of a test case
"
Class {
	#name : 'DTMaTestCaseMessagesNode',
	#superclass : 'DTTreeNode',
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'accessing' }
DTMaTestCaseMessagesNode >> messages: aTestCaseMessages [

	self
		name: aTestCaseMessages testCase selector;
		subResults: (DTMaMessageNode toNodes: aTestCaseMessages messages ).
	self subResults do: [ :messageNode | messageNode browseMethod: aTestCaseMessages testMethod ]
]
