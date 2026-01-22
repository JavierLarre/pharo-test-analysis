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
	^ DTRTDTestCaseMessagesNode buildNodeByClass: viewModel testCasesMessages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIHelpers [

	<dtTestMaResultTreeNamed: 'List of helpers' order: 3>
	^ DTRTDTestCaseHelpersNode buildNodeByClass: viewModel testCasesHelpers
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIMethodsPriority [

	<dtTestMaResultTreeNamed: 'List of methods and their priorities' order: 5>
	^ DTRTDTestCasePriorityNode buildNodeByClass: viewModel testCasesPriorities 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUISelfSentMessages [

	<dtTestMaResultTreeNamed: 'List of self sent methods' order: 2>
	^ DTRTDTestCaseHelpersNode buildNodeByClass: viewModel testCasesSelfSentMethods
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 4>
	^ DTRTDTestCaseMessagesNode buildTestCasesNodes: viewModel testCasesMessages
]

{ #category : 'accessing' }
DTRTDResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
