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
DTRTDResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
