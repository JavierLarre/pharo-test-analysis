"
I store the detected smells resulting from the plugin
"
Class {
	#name : 'DTTSDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'assertionlessTests',
		'overwrittenSetupTests'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDResult >> assertionlessTests [

	^ assertionlessTests ifNil: [ assertionlessTests := OrderedCollection new ]
]

{ #category : 'accessing' }
DTTSDResult >> assertionlessTests: anObject [

	assertionlessTests := anObject
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUI [ 
	
	<dtTestTSDResultTreeNamed: 'Tests without assertions' order: 1>
	^ self buildTreeFrom: self assertionlessTests 
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUIOverwrittenSetup [
	
	<dtTestTSDResultTreeNamed: 'Tests that overwrite setup' order: 2>
	^ self buildTreeFrom: self overwrittenSetupTests 
]

{ #category : 'private' }
DTTSDResult >> buildTreeFrom: testCases [

	^ self treeNode subResults: (testCases collect: #asResultForDrTest )
]

{ #category : 'accessing' }
DTTSDResult >> overwrittenSetupTests [

	^ overwrittenSetupTests
]

{ #category : 'accessing' }
DTTSDResult >> overwrittenSetupTests: anObject [

	overwrittenSetupTests := anObject
]

{ #category : 'factory' }
DTTSDResult >> treeNode [ 

	^ DTTreeNode new
]
