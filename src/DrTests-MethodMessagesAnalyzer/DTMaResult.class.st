"
I am the result report for the MethodMessageAnalyzer plugin for DrTests
"
Class {
	#name : 'DTMaResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'factory' }
DTMaResult >> buildMessageLeafNode: message [

	^ DTTreeLeafNode new
		  content: (DTMaMessageNode new
				   message: message;
				   yourself);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority' order: 1>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessages collect: [ :testCaseMessages |
						   self buildTreeNode
							   name: testCaseMessages testCase selector;
							   subResults: (testCaseMessages messages collect: [ :message | 
									self buildMessageLeafNode: message ]) ]);
		  yourself
]

{ #category : 'private' }
DTMaResult >> buildTreeNode [

	^ DTTreeNode new
		yourself
]

{ #category : 'accessing' }
DTMaResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
