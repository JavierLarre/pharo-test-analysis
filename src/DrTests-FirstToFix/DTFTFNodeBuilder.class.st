"
I provide builder methods and hooks to build `DTTreeNode`s from test cases
"
Class {
	#name : 'DTFTFNodeBuilder',
	#superclass : 'Object',
	#category : 'DrTests-FirstToFix-Builders',
	#package : 'DrTests-FirstToFix',
	#tag : 'Builders'
}

{ #category : 'hooks' }
DTFTFNodeBuilder >> buildNode: aTreeNode from: aMethodViewModel [
]

{ #category : 'utilities' }
DTFTFNodeBuilder >> groupedTestCasesByClass: methodViewModels [

	^ methodViewModels groupedBy: [ :methodViewModel | methodViewModel compiledMethod methodClass ]
]

{ #category : 'factory' }
DTFTFNodeBuilder >> nodeFrom: aMethodViewModel [

	| treeNode |
	treeNode := self treeNode
		            subResults: (DTFTFMessageNode toNodes: aMethodViewModel messages);
		            name: aMethodViewModel compiledMethod selector;
						browseBlock: [ aMethodViewModel compiledMethod drTestsBrowse ];
		            yourself.
	self buildNode: treeNode from: aMethodViewModel.
	^ treeNode
]

{ #category : 'factory' }
DTFTFNodeBuilder >> nodeGroupedByClasses: methodViewModels [

	^ self treeNode
		subResults: (self nodesByClass: methodViewModels );
		yourself
]

{ #category : 'factory' }
DTFTFNodeBuilder >> nodesByClass: methodViewModels [

	^ (self groupedTestCasesByClass: methodViewModels ) associations collect: [ :assoc | 
			self treeNode
				subResults: (self nodesFrom: assoc value);
				name: assoc key name; yourself ]
]

{ #category : 'factory' }
DTFTFNodeBuilder >> nodesFrom: methodViewModels [

	^ methodViewModels collect: [ :testCaseViewModel |
			self nodeFrom: testCaseViewModel ]
]

{ #category : 'factory' }
DTFTFNodeBuilder >> treeNode [

	^ DTTreeNode new
		subResultsAggregator: [ :subResults | subResults size ];
		yourself
]
