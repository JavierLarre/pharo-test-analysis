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
DTRTDMessagesNodeBuilder >> buildNode: aTreeNode from: aMethodViewModel [

	aTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aMethodViewModel compiledMethod ]
]
