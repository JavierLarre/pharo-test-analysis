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

	<dtTestRTDResultTreeNamed: 'First to fix tests' order: 1>
	^ DTRTDFirstFixBuilder new nodeGroupedByClasses: viewModel priorities
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIAssertionLess [

	<dtTestRTDResultTreeNamed: 'Tests with no assertions' order: 6>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel messages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIClassReferences [

	<dtTestRTDResultTreeNamed: 'Tests that have too many references' order: 9>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel messages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIHelpers [

	<dtTestRTDResultTreeNamed: 'Helpers of methods' order: 3>
	^ DTRTDHelperNodeBuilder new nodeGroupedByClasses: viewModel helpers
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIMessages [

	<dtTestRTDResultTreeNamed: 'Messages of methods' order: 5>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel messages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIOverwrittenSetup [

	<dtTestRTDResultTreeNamed: 'Tests that overwritten the setup' order: 7>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel messages 
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUISelfSentMessages [

	<dtTestRTDResultTreeNamed: 'Self sent methods' order: 2>
	^ DTRTDHelperNodeBuilder new nodeGroupedByClasses: viewModel selfSentMethods
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIShowAllMessages [

	<dtTestRTDResultTreeNamed: 'All method messages' order: 4>
	^ DTRTDNodeBuilder new treeNode
		subResults: (DTRTDMessagesNodeBuilder new nodesFrom: viewModel messages)
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIUselessSetup [

	<dtTestRTDResultTreeNamed: 'Tests that does not use setup' order: 8>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel messages 
]

{ #category : 'accessing' }
DTRTDResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
