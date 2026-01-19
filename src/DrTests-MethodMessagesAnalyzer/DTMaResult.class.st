"
I am the result report for the MethodMessageAnalyzer plugin for DrTests
"
Class {
	#name : 'DTMaResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'result',
		'visitor'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'factory' }
DTMaResult >> buildClassNode: aClass withResults: aCollection [

	^ self buildTreeNode 
		name: aClass name;
		subResults: (aCollection collect: [ :analysisData | 
			self buildTreeNode 
				name: analysisData testCase selector; 
				subResults: (analysisData buildMessagesNodes collect: [ :messageNode |
					DTTreeLeafNode new content: messageNode; yourself ] ) ; 
				yourself ] )
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [
	
	<dtTestMaResultTreeNamed: 'List of methods messages' order: 1>
	^ self buildTreeNode 
		subResults: (visitor messages methodsAnalyzed collect: [ :compiledMethod | 
			self buildTreeNode 
			name: compiledMethod selector;
			subResults: ((visitor messages methodMessages: compiledMethod ) collect: [ :message |
				DTTreeLeafNode new content: ( DTMaMessageNode new message: message; yourself ); yourself ] ) ] );
		yourself
]

{ #category : 'private' }
DTMaResult >> buildTreeNode [
	"Returns a node with the sub-results aggregator initialized in a way that it sum the durations of sub results."

	^ DTTreeNode new
		"subResultsAggregator: [ :subResults |
				subResults
					inject: 0 
					into: [ :totalMessages :dtTreeLeaf | 
						totalMessages + dtTreeLeaf content analyserVisitor messages methodsAnalyzed size ] ];"
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

{ #category : 'accessing' }
DTMaResult >> visitor: aVisitor [

	visitor := aVisitor 

	
]
