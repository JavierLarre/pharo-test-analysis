Class {
	#name : 'DTRTDPriorityNodeBuilder',
	#superclass : 'DTRTDMessagesNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'building' }
DTRTDPriorityNodeBuilder >> buildNodeFrom: aTestCaseViewModel [

	^ (super buildNodeFrom: aTestCaseViewModel)
		subResults: { 
			self buildTreeNode 
				subResults: (self class superclass new 
					buildTestCasesNodes: aTestCaseViewModel lowerPriorityCases) asOrderedCollection;
				name: 'Is lower priority than'; yourself.
			self buildTreeNode 
				subResults: (self class superclass new 
					buildTestCasesNodes: aTestCaseViewModel higherPriorityCases ) asOrderedCollection;
				name: 'Is higher priority than'; yourself.
		 } asOrderedCollection;
		yourself
]
