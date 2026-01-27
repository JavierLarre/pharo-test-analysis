"
I override `DTRTDNodeBuilder>>#buildNode:from:` to add a browse method to each message node
"
Class {
	#name : 'DTRTDHelperNodeBuilder',
	#superclass : 'DTRTDNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-Builders',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Builders'
}

{ #category : 'hooks' }
DTRTDHelperNodeBuilder >> buildNode: aTreeNode from: aMethodViewModel [

	aTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aMethodViewModel compiledMethod methodClass >> messageNode message ]
]
