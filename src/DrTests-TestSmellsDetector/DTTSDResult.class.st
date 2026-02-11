Class {
	#name : 'DTTSDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'assertionlessTests'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDResult >> assertionlessTests: anObject [

	assertionlessTests := anObject
]

{ #category : 'accessing' }
DTTSDResult >> buildTreeForUI [ 
	
	<dtTestTSDResultTreeNamed: 'Tests without assertions' order: 1>
	^ self treeNode subResults: (assertionlessTests collect: [ :assertionlessTest | 
		assertionlessTest asResultForDrTest ])  
]

{ #category : 'factory' }
DTTSDResult >> treeNode [ 

	^ DTTreeNode new
]
