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
DTRTDHelperNodeBuilder >> buildNode: aTestCaseTreeNode from: aTestCaseViewModel [

	aTestCaseTreeNode subResults do: [ :messageNode | 
		messageNode browseMethod: aTestCaseViewModel testMethod methodClass >> messageNode message ]
]
