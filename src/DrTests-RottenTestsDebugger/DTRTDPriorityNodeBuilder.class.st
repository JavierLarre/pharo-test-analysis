"
I override `DTRTDNodeBuilder>>#nodeFrom:` to build the priorities of each test case
"
Class {
	#name : 'DTRTDPriorityNodeBuilder',
	#superclass : 'DTRTDMessagesNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-Builders',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Builders'
}

{ #category : 'building' }
DTRTDPriorityNodeBuilder >> nodeFrom: aTestCaseViewModel [

	^ (super nodeFrom: aTestCaseViewModel)
		subResults: { 
			self treeNode 
				subResults: (self class superclass new 
					nodesFrom: aTestCaseViewModel lowerPriorityCases);
				name: 'Is lower priority than'; yourself.
			self treeNode 
				subResults: (self class superclass new 
					nodesFrom: aTestCaseViewModel higherPriorityCases );
				name: 'Is higher priority than'; yourself.
		 } asOrderedCollection;
		yourself
]
