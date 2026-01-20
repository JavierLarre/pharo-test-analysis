Class {
	#name : 'DTMaTestCaseHelpersNode',
	#superclass : 'DTTreeNode',
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'accessing' }
DTMaTestCaseHelpersNode >> helpers: aTestCaseHelpers [

	self
		name: aTestCaseHelpers testCase selector;
		subResults: (DTMaMessageNode toNodes: aTestCaseHelpers messages ).
	self subResults do: [ :messageNode | messageNode browseMethod: aTestCaseHelpers testCase class >> messageNode message ]
]
