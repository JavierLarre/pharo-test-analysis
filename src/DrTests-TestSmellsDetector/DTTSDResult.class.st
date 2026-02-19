"
I build DrTest trees from the tests stored in `DTTSDTestData`
"
Class {
	#name : 'DTTSDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'testData'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'instance creation' }
DTTSDResult class >> testData: aTestData [

	^ self new testData: aTestData; yourself
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUI [ 
	
	<dtTestTSDResultTreeNamed: 'Tests without assertions' order: 1>
	^ self buildTreeFrom: self testData assertionlessTests 
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUIManyClassReferences [

	<dtTestTSDResultTreeNamed: 'Tests references classes too many times' order: 3>
	^ self buildTreeFrom: self testData manyClassReferencesTests 
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUIOverwrittenSetup [
	
	<dtTestTSDResultTreeNamed: 'Tests that overwrite setup' order: 2>
	^ self buildTreeFrom: self testData overwrittenSetupTests 
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUIUselessSetup [ 

	<dtTestTSDResultTreeNamed: 'Tests not fully using their set up' order: 4>
	^ self buildTreeFrom: self testData uselessSetupTests 
]

{ #category : 'private' }
DTTSDResult >> buildTreeFrom: testCases [

	^ self treeNode subResults: (testCases collect: #asResultForDrTest )
]

{ #category : 'accessing' }
DTTSDResult >> testData [

	^ testData
]

{ #category : 'accessing' }
DTTSDResult >> testData: anObject [

	testData := anObject
]

{ #category : 'factory' }
DTTSDResult >> treeNode [ 

	^ DTTreeNode new
]
