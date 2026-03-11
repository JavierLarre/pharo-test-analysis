"
I route the logic for displaying different analysis options
"
Class {
	#name : 'DTFTFResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-FirstToFix-Presenters',
	#package : 'DrTests-FirstToFix',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTFTFResult >> buildTreeForUI [

	<dtTestRTDResultTreeNamed: 'First to fix tests' order: 1>
	^ DTFTFFirstFixBuilder new nodeGroupedByClasses: viewModel priorities
]

{ #category : 'accessing' }
DTFTFResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
