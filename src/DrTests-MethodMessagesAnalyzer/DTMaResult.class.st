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

{ #category : 'as yet unclassified' }
DTMaResult >> buildTestCaseMessagesNode: testCaseMessages [

	^ self buildTreeNode
		  name: testCaseMessages testCase selector;
		  subResults: (testCaseMessages messages collect: [ :message | self buildMessageLeafNode: message ])
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority' order: 2>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessages collect: [ :testCaseMessages |
						   self buildTestCaseMessagesNode: testCaseMessages ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIGroupedByClass [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority grouped by class' order: 1>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessagesByClass associations collect: [ :assoc |
						   self buildTreeNode: assoc value byClass: assoc key ]);
		  yourself
]

{ #category : 'private' }
DTMaResult >> buildTreeNode [

	^ DTTreeNode new
		yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeNode: testCasesMessages byClass: aClass [

	^ self buildTreeNode
		  name: aClass name;
		  subResults: (testCasesMessages collect: [ :testCaseMessages | 
			self buildTestCaseMessagesNode: testCaseMessages ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
