"
I build `DTRTDTestCaseViewModel`s sorted by most important first
"
Class {
	#name : 'DTFTFFirstFixVisitor',
	#superclass : 'DTFTFMessagesVisitor',
	#category : 'DrTests-FirstToFix-Visitors',
	#package : 'DrTests-FirstToFix',
	#tag : 'Visitors'
}

{ #category : 'adding' }
DTFTFFirstFixVisitor >> addPrioritiesTo: aPriorities [

	aPriorities 
		lowerPriorityMethods: (self buildTestCasesFrom: 
			(self methodsThatInclude: aPriorities compiledMethod ))
]

{ #category : 'private' }
DTFTFFirstFixVisitor >> buildTestCasesFrom: compiledMethods [

	^ (compiledMethods 
		sorted: [ :methodBefore :methodAfter |
			(self priority: methodBefore ) > (self priority: methodAfter ) ] )
		collect: [ :compiledMethod | 
			DTFTFMethodData new 
				messages: (self methodVisitor messages at: compiledMethod); 
				compiledMethod: compiledMethod;
				yourself  ]
]

{ #category : 'building' }
DTFTFFirstFixVisitor >> buildViewModel: aViewModel [

	self methodViewModels do: [ :methodViewModel | self addPrioritiesTo: methodViewModel ].
	aViewModel priorities: self methodViewModels.
	aViewModel priorities sort: [ :aPriority :aLowerPriority | 
		aPriority lowerPriorityMethods size >= aLowerPriority lowerPriorityMethods size ]
]

{ #category : 'factory' }
DTFTFFirstFixVisitor >> methodViewModelClass [

	^ DTFTFTestCaseData 
]

{ #category : 'accessing' }
DTFTFFirstFixVisitor >> methodViewModels [

	^ methodViewModels ifNil: [ methodViewModels := SortedCollection new
		sort: [ :methodBefore :methodAfter |
			(self priority: methodBefore compiledMethod) > (self priority: methodAfter compiledMethod ) ];
		yourself ]
]

{ #category : 'private' }
DTFTFFirstFixVisitor >> methodsThatInclude: aCompiledMethod [

	^ self methodVisitor messages methodsThatInclude: aCompiledMethod
]

{ #category : 'private' }
DTFTFFirstFixVisitor >> priority: aCompiledMethod [

	^ (self methodsThatInclude: aCompiledMethod) size
]
