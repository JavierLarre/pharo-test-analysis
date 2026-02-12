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
			DTRTDMethodData new 
				messages: (self methodVisitor messages at: compiledMethod); 
				compiledMethod: compiledMethod;
				yourself  ]
]

{ #category : 'building' }
DTRTDFirstFixVisitor >> buildViewModel: aViewModel [

	self methodViewModels
		do: [ :methodViewModel | self addPrioritiesTo: methodViewModel ].
	aViewModel priorities: self methodViewModels 
]

{ #category : 'factory' }
DTRTDFirstFixVisitor >> methodViewModelClass [

	^ DTRTDTestCaseData 
]

{ #category : 'accessing' }
DTRTDFirstFixVisitor >> methodViewModels [

	^ methodViewModels ifNil: [ methodViewModels := SortedCollection new
		sort: [ :methodBefore :methodAfter |
			(self priority: methodBefore compiledMethod) > (self priority: methodAfter compiledMethod ) ];
		yourself ]
]

{ #category : 'private' }
DTRTDFirstFixVisitor >> methodsThatInclude: aCompiledMethod [

	^ self methodVisitor messages methodsThatInclude: aCompiledMethod
]

{ #category : 'private' }
DTRTDFirstFixVisitor >> priority: aCompiledMethod [

	^ (self methodsThatInclude: aCompiledMethod) size
]
