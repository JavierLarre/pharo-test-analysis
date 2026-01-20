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

{ #category : 'factory' }
DTMaResult >> buildMessageLeafNode: message browseMethod: aBrowsable [

	^ DTTreeLeafNode new
		  content: (DTMaMessageNode new
				   message: message;
					browseMethod: aBrowsable;
				   yourself);
		  yourself
]

{ #category : 'factory' }
DTMaResult >> buildTestCaseHelpersNode: testCaseHelpers [

	^ self buildTreeNode
		  name: testCaseHelpers testCase selector;
		  subResults: (testCaseHelpers messages collect: [ :message | 
			self buildMessageLeafNode: message browseMethod: testCaseHelpers testCase class >> message ])
]

{ #category : 'factory' }
DTMaResult >> buildTestCaseMessagesNode: testCaseMessages [

	^ self buildTreeNode
		  name: testCaseMessages testCase selector;
		  subResults: (testCaseMessages messages collect: [ :message | 
			self buildMessageLeafNode: message browseMethod: testCaseMessages testMethod ])
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority grouped by class' order: 1>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessagesByClass associations collect: [ :assoc |
						   self buildTreeNode: assoc value byClass: assoc key ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIHelpers [

	<dtTestMaResultTreeNamed: 'List of all method helpers grouped by class' order: 3>
	^ self buildTreeNode
		  subResults: (viewModel testCasesHelpersByClass associations collect: [ :assoc |
						   self buildTreeNodeHelpers: assoc value byClass: assoc key ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 2>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessages collect: [ :testCaseMessages |
						   self buildTestCaseMessagesNode: testCaseMessages ]);
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
DTMaResult >> buildTreeNodeHelpers: testCasesHelpers byClass: aClass [

	^ self buildTreeNode
		  name: aClass name;
		  subResults: (testCasesHelpers collect: [ :testCaseHelpers | 
			(self buildTestCaseHelpersNode: testCaseHelpers) ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
