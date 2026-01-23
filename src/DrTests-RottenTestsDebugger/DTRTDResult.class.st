"
I route the logic for displaying different analysis options
"
Class {
	#name : 'DTRTDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-RottenTestsDebugger-Presenters',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUI [

	<dtTestRTDResultTreeNamed: 'Messages of methods sorted by priority' order: 1>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel testCasesMessages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIHelpers [

	<dtTestRTDResultTreeNamed: 'Helpers of methods' order: 3>
	^ DTRTDHelperNodeBuilder new nodeGroupedByClasses: viewModel testCasesHelpers
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIMethodsPriority [

	<dtTestRTDResultTreeNamed: 'Priorities of each method' order: 5>
	^ DTRTDPriorityNodeBuilder new nodeGroupedByClasses: viewModel testCasesPriorities 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUISelfSentMessages [

	<dtTestRTDResultTreeNamed: 'Self sent methods' order: 2>
	^ DTRTDHelperNodeBuilder new nodeGroupedByClasses: viewModel testCasesSelfSentMethods
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIShowAllMessages [

	<dtTestRTDResultTreeNamed: 'All method messages' order: 4>
	^ DTRTDNodeBuilder new treeNode
		subResults: (DTRTDMessagesNodeBuilder new nodesFrom: viewModel testCasesMessages)
]

{ #category : 'accessing' }
DTRTDResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
