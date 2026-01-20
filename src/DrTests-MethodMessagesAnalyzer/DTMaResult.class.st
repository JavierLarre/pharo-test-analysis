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
DTMaResult >> buildNodeWithCases: testCasesMessages andNodeClass: aClass [

	^ self buildTreeNode
		  subResults: (testCasesMessages 
							collect: [ :testCaseHelpers | 
								(aClass new messages: testCaseHelpers; yourself ) ]);
		  yourself
]

{ #category : 'accessing' }
DTMaResult >> buildNodesWithClass: testCasesMessages andNodeClass: aClass [

	^ (self groupTestCasesByClass: testCasesMessages ) associations collect: [ :assoc | 
		(self buildNodeWithCases: assoc value andNodeClass: aClass )
			name: assoc key name;
			yourself ]
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority grouped by class' order: 1>
	^ self buildTreeNode
		subResults: (self 
			buildNodesWithClass: viewModel testCasesMessages 
			andNodeClass: DTMaTestCaseMessagesNode );
		yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIHelpers [

	<dtTestMaResultTreeNamed: 'List of all method helpers grouped by class' order: 3>
	^ self buildTreeNode
		subResults: (self 
			buildNodesWithClass: viewModel testCasesHelpers 
			andNodeClass: DTMaTestCaseHelpersNode );
		yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUISelfSentMessages [

	<dtTestMaResultTreeNamed: 'List of self sent methods' order: 2>
	^ self buildTreeNode
		subResults: (self 
			buildNodesWithClass: viewModel testCasesSelfSentMethods 
			andNodeClass: DTMaTestCaseHelpersNode );
		yourself
]

{ #category : 'accessing' }
DTMaResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 4>
	^ self 
		buildNodeWithCases: viewModel testCasesMessages
		andNodeClass: DTMaTestCaseMessagesNode
]

{ #category : 'private' }
DTMaResult >> buildTreeNode [

	^ DTTreeNode new
]

{ #category : 'utilities' }
DTMaResult >> groupTestCasesByClass: testCasesMessages [

	^ testCasesMessages groupedBy: [ :testCaseMessages | testCaseMessages testCase class ]
]

{ #category : 'accessing' }
DTMaResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
