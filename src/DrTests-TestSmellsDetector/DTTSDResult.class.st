"
I store the detected smells resulting from the plugin
"
Class {
	#name : 'DTTSDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'assertionlessTests',
		'overwrittenSetupTests',
		'manyClassReferencesTests',
		'uselessSetupTests'
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
DTTSDResult >> buildTreeForUIManyClassReferences [

	<dtTestTSDResultTreeNamed: 'Tests references classes too many times' order: 3>
	^ self buildTreeFrom: self manyClassReferencesTests 
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUIOverwrittenSetup [
	
	<dtTestTSDResultTreeNamed: 'Tests that overwrite setup' order: 2>
	^ self buildTreeFrom: self overwrittenSetupTests 
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUIUselessSetup [ 

	<dtTestTSDResultTreeNamed: 'Tests not fully using their set up' order: 4>
	^ self buildTreeFrom: self uselessSetupTests 
]

{ #category : 'private' }
DTTSDResult >> buildTreeFrom: testCases [

	^ self treeNode subResults: (testCases collect: #asResultForDrTest )
]

{ #category : 'accessing' }
DTTSDResult >> manyClassReferencesTests [

	^ manyClassReferencesTests
]

{ #category : 'accessing' }
DTTSDResult >> manyClassReferencesTests: anObject [

	manyClassReferencesTests := anObject
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

{ #category : 'accessing' }
DTTSDResult >> uselessSetupTests [

	^ uselessSetupTests
]

{ #category : 'accessing' }
DTTSDResult >> uselessSetupTests: anObject [

	uselessSetupTests := anObject
]
