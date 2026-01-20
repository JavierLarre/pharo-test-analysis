"
I am the result report for the MethodMessageAnalyzer plugin for DrTests
"
Class {
	#name : 'DTMaResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'accessing' }
DTMaResult >> buildHelpersTreeNode: testCasesHelpers [

	^ self buildTreeNode
		  subResults: (testCasesHelpers collect: [ :testCaseHelpers | 
			(DTMaTestCaseHelpersNode new helpers: testCaseHelpers; yourself ) ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildMessagesTreeNode: testCasesMessages [

	^ self buildTreeNode
		  subResults: (testCasesMessages collect: [ :testCaseMessages | 
			DTMaTestCaseMessagesNode new messages: testCaseMessages; yourself ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority grouped by class' order: 1>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessagesByClass associations collect: [ :assoc |
						   (self buildMessagesTreeNode: assoc value)
							name: assoc key name; yourself ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIHelpers [

	<dtTestMaResultTreeNamed: 'List of all method helpers grouped by class' order: 3>
	^ self buildTreeNode
		  subResults: (viewModel testCasesHelpersByClass associations collect: [ :assoc |
						   (self buildHelpersTreeNode: assoc value)
							name: assoc key name; yourself ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 2>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessages collect: [ :testCaseMessages |
						   self buildTreeNode
							name: testCaseMessages testCase selector;
							subResults: (testCaseMessages messages collect: [ :message | 
								DTMaMessageNode new message: message; yourself ]); 
							yourself ]);
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
