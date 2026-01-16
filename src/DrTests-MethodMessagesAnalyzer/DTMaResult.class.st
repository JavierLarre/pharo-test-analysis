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

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [
	
	<dtTestMaResultTreeNamed: 'List of analyzed methods' order: 1>
	^ self buildTreeNode 
		subResults: { self buildTreeNode 
							name: #aSelector;
							subResults: { DTTreeLeafNode new 
												content: (DTMaAnalysisData new 
																analyserVisitor: MaMessageVisitor new;
																yourself);
												yourself }; 
							yourself };
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
