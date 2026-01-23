"
I override `DTRTDNodeBuilder>>#buildNode:from:` to add a browse method to each node
"
Class {
	#name : 'DTRTDHelperNodeBuilder',
	#superclass : 'DTRTDNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'hooks' }
DTRTDHelperNodeBuilder >> buildNode: aTreeNode from: aTestCaseViewModel [

	aTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aTestCaseViewModel testCase class >> messageNode message ]
]
