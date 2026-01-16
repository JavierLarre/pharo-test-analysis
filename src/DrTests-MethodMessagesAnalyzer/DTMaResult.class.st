"
I am the result report for the MethodMessageAnalyzer plugin for DrTests
"
Class {
	#name : 'DTMaResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'result'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'factory' }
DTMaResult >> buildClassNode: aClass withResults: aCollection [

	^ self buildTreeNode 
		name: aClass name;
		subResults: (aCollection collect: [ :analysisData | 
			DTTreeLeafNode new content: analysisData; yourself ] )
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [
	
	<dtTestMaResultTreeNamed: 'List of analyzed methods' order: 1>
	^ self buildTreeNode 
		subResults: ((self results groupedBy: [ :analysisData | analysisData testCase class ]) 
							associations collect: [ :assoc | self buildClassNode: assoc key withResults: assoc value ] );
		yourself
]

{ #category : 'private' }
DTMaResult >> buildTreeNode [
	"Returns a node with the sub-results aggregator initialized in a way that it sum the durations of sub results."

	^ DTTreeNode new
		subResultsAggregator: [ :subResults |
				subResults
					inject: 0 
					into: [ :totalMessages :dtTreeLeaf | 
						totalMessages + dtTreeLeaf content analyserVisitor messages methodsAnalyzed size ] ];
		yourself
]

{ #category : 'accessing' }
DTMaResult >> result: anObject [

	result := anObject
]

{ #category : 'accessing' }
DTMaResult >> results [

	^ result
]
