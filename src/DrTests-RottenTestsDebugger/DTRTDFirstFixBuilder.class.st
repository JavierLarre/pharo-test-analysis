"
I override `DTRTDNodeBuilder>>#nodeFrom:` to build the most important methods of each test case
"
Class {
	#name : 'DTRTDFirstFixBuilder',
	#superclass : 'DTRTDMessagesNodeBuilder',
	#category : 'DrTests-RottenTestsDebugger-Builders',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Builders'
}

{ #category : 'factory' }
DTRTDFirstFixBuilder >> nodeFrom: aMethodViewModel [

	^ (super nodeFrom: aMethodViewModel)
		name: aMethodViewModel compiledMethod selector, ' is more important than:';
		subResults: (self class superclass new "small hack to prevent using this nodeFrom"
				nodesFrom: aMethodViewModel lowerPriorityMethods);
		subResultsAggregator: [ :subResults | 
			aMethodViewModel lowerPriorityMethods size ];
		yourself
]
