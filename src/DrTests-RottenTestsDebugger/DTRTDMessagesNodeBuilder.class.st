"
I override `DTRTDNodeBuilder>>#buildNode:from:` to add a browse method to each node
"
Class {
	#name : 'DTRTDMessagesNodeBuilder',
	#superclass : 'DTRTDNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-Builders',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Builders'
}

{ #category : 'hooks' }
DTRTDMessagesNodeBuilder >> buildNode: aTestCaseTreeNode from: aTestCaseViewModel [

	aTestCaseTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aTestCaseViewModel testMethod ]
]
