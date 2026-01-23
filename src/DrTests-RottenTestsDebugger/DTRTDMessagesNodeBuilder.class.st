"
I override `DTRTDNodeBuilder>>#buildNode:from:` to add a browse method to each node
"
Class {
	#name : 'DTRTDMessagesNodeBuilder',
	#superclass : 'DTRTDNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'building' }
DTRTDMessagesNodeBuilder >> buildNode: aTreeNode from: aTestCaseViewModel [

	aTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aTestCaseViewModel testMethod ]
]
