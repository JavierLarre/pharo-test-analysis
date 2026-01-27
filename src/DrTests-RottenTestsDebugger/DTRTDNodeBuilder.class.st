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
DTRTDNodeBuilder >> buildNode: aTreeNode from: aMethodViewModel [
]

{ #category : 'utilities' }
DTRTDNodeBuilder >> groupedTestCasesByClass: methodViewModels [

	^ methodViewModels groupedBy: [ :methodViewModel | methodViewModel compiledMethod methodClass ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodeFrom: aMethodViewModel [

	| treeNode |
	treeNode := self treeNode
		            subResults: (DTRTDMessageNode toNodes: aMethodViewModel messages);
		            name: aMethodViewModel compiledMethod selector;
						browseBlock: [ aMethodViewModel compiledMethod drTestsBrowse ];
		            yourself.
	self buildNode: treeNode from: aMethodViewModel.
	^ treeNode
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodeGroupedByClasses: methodViewModels [

	^ self treeNode
		subResults: (self nodesByClass: methodViewModels );
		yourself
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodesByClass: methodViewModels [

	^ (self groupedTestCasesByClass: methodViewModels ) associations collect: [ :assoc | 
			self treeNode
				subResults: (self nodesFrom: assoc value);
				name: assoc key name; yourself ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> nodesFrom: methodViewModels [

	^ methodViewModels collect: [ :testCaseViewModel |
			self nodeFrom: testCaseViewModel ]
]

{ #category : 'factory' }
DTRTDNodeBuilder >> treeNode [

	^ DTTreeNode new
		subResultsAggregator: [ :subResults | subResults size ];
		yourself
]
