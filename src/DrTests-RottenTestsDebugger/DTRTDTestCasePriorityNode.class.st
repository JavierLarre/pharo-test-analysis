"
I am a tree node for displaying methods and their priorities
"
Class {
	#name : 'DTRTDTestCasePriorityNode',
	#superclass : 'DTRTDTestCaseMessagesNode',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'instance creation' }
DTRTDTestCasePriorityNode class >> messages: aTestCasePriorities [

	^ self buildTreeNode 
		name: aTestCasePriorities testCase selector;
		browseBlock: [ aTestCasePriorities testMethod drTestsBrowse ];
		subResults: {
			self buildTreeNode 
				subResults: (self superclass 
					buildTestCasesNodes: aTestCasePriorities lowerPriorityCases);
				name: 'Is lower priority than:'; yourself.
			self buildTreeNode
				subResults: (self superclass 
					buildTestCasesNodes: aTestCasePriorities higherPriorityCases);
				name: 'Is higher priority than:'; yourself 
		 };
		yourself
]
