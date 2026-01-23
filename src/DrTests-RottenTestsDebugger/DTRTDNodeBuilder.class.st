"
I provide builder methods and hooks to build `DTTreeNode`s from test cases
"
Class {
	#name : 'DTRTDNodeBuilder',
	#superclass : 'Object',
	#category : 'DrTests-RottenTestsDebugger-Builders',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Builders'
}

{ #category : 'hooks' }
DTRTDNodeBuilder >> buildNode: aTestCaseTreeNode from: aTestCaseViewModel [
]

{ #category : 'utilities' }
DTRTDNodeBuilder >> groupedTestCasesByClass: testCaseViewModels [

	^ testCaseViewModels groupedBy: [ :testCaseViewModel | testCaseViewModel testCase class ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodeFrom: aTestCaseViewModel [

	| treeNode |
	treeNode := self treeNode
		            subResults: (DTRTDMessageNode toNodes: aTestCaseViewModel messages);
		            name: aTestCaseViewModel testMethod selector;
						browseBlock: [ aTestCaseViewModel testMethod drTestsBrowse ];
		            yourself.
	self buildNode: treeNode from: aTestCaseViewModel.
	^ treeNode
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodeGroupedByClasses: testCasesMessages [

	^ self treeNode
		subResults: (self nodesByClass: testCasesMessages );
		yourself
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodesByClass: testCaseViewModels [

	^ (self groupedTestCasesByClass: testCaseViewModels ) associations collect: [ :assoc | 
			self treeNode
				subResults: (self nodesFrom: assoc value);
				name: assoc key name; yourself ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodesFrom: testCaseViewModels [

	^ testCaseViewModels collect: [ :testCaseViewModel |
			self nodeFrom: testCaseViewModel ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> treeNode [

	^ DTTreeNode new
		subResultsAggregator: [ :subResults | subResults size ];
		yourself
]
