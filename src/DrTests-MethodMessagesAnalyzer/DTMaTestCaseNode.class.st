"
I am a DrTestTreeLeaf for displaying the messages of a test case
"
Class {
	#name : 'DTMaTestCaseNode',
	#superclass : 'DTTreeNode',
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'accessing' }
DTMaTestCaseNode >> messages: aTestCaseMessages [

	self
		name: aTestCaseMessages testCase selector;
		subResults: (DTMaMessageNode toNodes: aTestCaseMessages messages )
]
