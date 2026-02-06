"
I build `DTRTDTestCaseViewModel`s sorted by most important first
"
Class {
	#name : 'DTRTDFirstFixVisitor',
	#superclass : 'DTRTDMessagesVisitor',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'adding' }
DTRTDFirstFixVisitor >> addPrioritiesTo: aPriorities [

	aPriorities 
		lowerPriorityMethods: (self buildTestCasesFrom: 
			(self methodsThatInclude: aPriorities compiledMethod ))
]

{ #category : 'private' }
DTRTDFirstFixVisitor >> buildTestCasesFrom: compiledMethods [

	^ (compiledMethods 
		sorted: [ :methodBefore :methodAfter |
			(self priority: methodBefore ) > (self priority: methodAfter ) ] )
		collect: [ :compiledMethod | 
			DTRTDMethodViewModel new 
				messages: (self methodVisitor messages at: compiledMethod); 
				compiledMethod: compiledMethod;
				yourself  ]
]

{ #category : 'building' }
DTRTDFirstFixVisitor >> buildViewModel: aViewModel [

	aViewModel priorities: self methodViewModels 
]

{ #category : 'factory' }
DTRTDFirstFixVisitor >> methodViewModelClass [

	^ DTRTDPrioritiesViewModel 
]

{ #category : 'private' }
DTRTDFirstFixVisitor >> methodsThatInclude: aCompiledMethod [

	^ self methodVisitor messages methodsThatInclude: aCompiledMethod
]

{ #category : 'private' }
DTRTDFirstFixVisitor >> priority: aCompiledMethod [

	^ (self methodsThatInclude: aCompiledMethod) size
]

{ #category : 'visiting' }
DTRTDFirstFixVisitor >> visitTestSuite: aTestSuite [

	super visitTestSuite: aTestSuite.
	self methodViewModels
		do: [ :methodViewModel | self addPrioritiesTo: methodViewModel ];
		sort: [ :methodBefore :methodAfter |
			(self priority: methodBefore compiledMethod) > (self priority: methodAfter compiledMethod ) ]
]
