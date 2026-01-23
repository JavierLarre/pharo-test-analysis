"
I provide builder methods and hooks to build `DTTreeNode`s from test cases
"
Class {
	#name : 'DTRTDNodeBuilder',
	#superclass : 'Object',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'hooks' }
DTRTDNodeBuilder >> buildNode: aTreeNode from: aTestCaseViewModel [
]

{ #category : 'factory' }
DTRTDNodeBuilder >> buildNodeByClass: testCasesMessages [

	^ self buildTreeNode
		subResults: (self buildNodesByClass: testCasesMessages );
		yourself
]

{ #category : 'building' }
DTRTDNodeBuilder >> buildNodeFrom: aTestCaseViewModel [

	| treeNode |
	treeNode := DTTreeNode new
		            subResults: (DTRTDMessageNode toNodes: aTestCaseViewModel messages);
		            name: aTestCaseViewModel testMethod selector;
		            subResultsAggregator: [ :subResults | subResults size ];
		            yourself.
	self buildNode: treeNode from: aTestCaseViewModel.
	^ treeNode
]

{ #category : 'factory' }
DTRTDNodeBuilder >> buildNodesByClass: testCaseViewModels [

	^ (self groupTestCasesByClass: testCaseViewModels ) associations collect: [ :assoc | 
			self buildTreeNode
				subResults: (self buildTestCasesNodes: assoc value);
				name: assoc key name; yourself ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> buildTestCasesNodes: testCaseViewModels [

	^ testCaseViewModels collect: [ :testCaseViewModel |
			self buildNodeFrom: testCaseViewModel ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> buildTreeNode [

	^ DTTreeNode new
]

{ #category : 'utilities' }
DTRTDNodeBuilder >> groupTestCasesByClass: testCaseViewModels [

	^ testCaseViewModels groupedBy: [ :testCaseViewModel | testCaseViewModel testCase class ]
]
