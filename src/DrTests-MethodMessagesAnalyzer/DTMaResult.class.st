"
I route the logic for displaying different analysis options
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
		  subResults: (testCasesHelpers 
							collect: [ :testCaseHelpers | 
								(DTMaTestCaseHelpersNode new messages: testCaseHelpers; yourself ) ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildMessagesTreeNode: testCasesMessages [

	^ self buildTreeNode
		  subResults: (testCasesMessages 
							reject: [ :testCaseMessages | testCaseMessages messages isEmpty ] 
							thenCollect: [ :testCaseMessages | 
								DTMaTestCaseNode new messages: testCaseMessages; yourself ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority grouped by class' order: 1>
	^ self buildTreeNode
		  subResults: (viewModel testCasesMessagesByClass associations
							collect: [ :assoc |
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
							             name: assoc key name;
							             yourself ]);
		            yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUISelfSentMessages [

	<dtTestMaResultTreeNamed: 'List of self sent methods' order: 2>
	^ self buildTreeNode
		  subResults: (viewModel testCasesSelfSentMethodsByClass associations collect: [ :assoc |
						   (self buildHelpersTreeNode: assoc value)
								name: assoc key name; 
								yourself ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 4>
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
