"
I route the logic for displaying different analysis options
"
Class {
	#name : 'DTRTDResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'viewModel'
	],
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'accessing' }
DTRTDResult >> buildNodeWithCases: testCasesMessages andNodeClass: aClass [

	^ self buildTreeNode
		  subResults: (testCasesMessages 
							collect: [ :testCaseHelpers | 
								(aClass new messages: testCaseHelpers; yourself ) ]);
		  yourself
]

{ #category : 'accessing' }
DTRTDResult >> buildNodesWithClass: testCasesMessages andNodeClass: aClass [

	^ (self groupTestCasesByClass: testCasesMessages ) associations collect: [ :assoc | 
		(self buildNodeWithCases: assoc value andNodeClass: aClass )
			name: assoc key name;
			yourself ]
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUI [

	<dtTestMaResultTreeNamed: 'List of methods messages sorted by priority grouped by class' order: 1>
	^ self buildTreeNode
		subResults: (self 
			buildNodesWithClass: viewModel testCasesMessages 
			andNodeClass: DTRTDTestCaseMessagesNode );
		yourself
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIHelpers [

	<dtTestMaResultTreeNamed: 'List of all method helpers grouped by class' order: 3>
	^ self buildTreeNode
		subResults: (self 
			buildNodesWithClass: viewModel testCasesHelpers 
			andNodeClass: DTRTDTestCaseHelpersNode );
		yourself
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUISelfSentMessages [

	<dtTestMaResultTreeNamed: 'List of self sent methods' order: 2>
	^ self buildTreeNode
		subResults: (self 
			buildNodesWithClass: viewModel testCasesSelfSentMethods 
			andNodeClass: DTRTDTestCaseHelpersNode );
		yourself
]

{ #category : 'accessing' }
DTRTDResult >> buildTreeForUIShowAllMessages [

	<dtTestMaResultTreeNamed: 'List of all method messages' order: 4>
	^ self 
		buildNodeWithCases: viewModel testCasesMessages
		andNodeClass: DTRTDTestCaseMessagesNode
]

{ #category : 'private' }
DTRTDResult >> buildTreeNode [

	^ DTTreeNode new
]

{ #category : 'utilities' }
DTRTDResult >> groupTestCasesByClass: testCasesMessages [

	^ testCasesMessages groupedBy: [ :testCaseMessages | testCaseMessages testCase class ]
]

{ #category : 'accessing' }
DTRTDResult >> viewModel: aViewModel [

	viewModel := aViewModel 
]
