Class {
	#name : 'DTTSDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUI [ 
	
	<dtTestTSDResultTreeNamed: 'Tests without assertions' order: 1>
	^ DTRTDMessagesNodeBuilder new nodeGroupedByClasses: viewModel assertionlessTests 
]

{ #category : 'accessing' }
DTTSDResult >> viewModel: anObject [

	viewModel := anObject
]
