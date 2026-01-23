"
I route the logic for displaying different analysis options
"
Class {
	#name : 'DTRTDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority' order: 1>
	^ DTRTDMessagesNodeBuilder new buildNodeByClass: viewModel testCasesMessages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIHelpers [

	<dtTestMaResultTreeNamed: 'List of helpers' order: 3>
	^ DTRTDHelperNodeBuilder new buildNodeByClass: viewModel testCasesHelpers
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIMethodsPriority [

	<dtTestMaResultTreeNamed: 'List of methods and their priorities' order: 5>
	^ DTRTDPriorityNodeBuilder new buildNodeByClass: viewModel testCasesPriorities 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUISelfSentMessages [

	<dtTestMaResultTreeNamed: 'List of self sent methods' order: 2>
	^ DTRTDHelperNodeBuilder new buildNodeByClass: viewModel testCasesSelfSentMethods
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 4>
	^ DTRTDNodeBuilder new buildTreeNode
		subResults: (DTRTDMessagesNodeBuilder new buildTestCasesNodes: viewModel testCasesMessages)
]

{ #category : 'accessing' }
DTRTDResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
