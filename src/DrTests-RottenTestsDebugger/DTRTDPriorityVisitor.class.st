"
I build the view model with `DTRTDTestCasePriorities`
"
Class {
	#name : 'DTRTDPriorityVisitor',
	#superclass : 'DTRTDMessagesVisitor',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDPriorityVisitor >> addPrioritiesTo: aTestCasePriorities [

	aTestCasePriorities 
		higherPriorityCases: (self buildTestCasesFrom: 
			(methodVisitor messages subMethodsIncludedBy: aTestCasePriorities testMethod));
		lowerPriorityCases: (self buildTestCasesFrom: 
			(methodVisitor messages methodsThatInclude: aTestCasePriorities testMethod)) 
]

{ #category : 'private' }
DTRTDPriorityVisitor >> buildTestCasesFrom: compiledMethods [

	^ compiledMethods 
		reject: [ :compiledMethod | 
			(methodVisitor messages at: compiledMethod) isEmpty ] 
		thenCollect: [ :compiledMethod | 
			DTRTDTestCaseViewModel new 
				messages: (methodVisitor messages at: compiledMethod); 
				testMethod: compiledMethod;
				yourself  ]
]

{ #category : 'building' }
DTRTDPriorityVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesPriorities: testCasesViewModels 
]

{ #category : 'factory' }
DTRTDPriorityVisitor >> testCaseViewModelClass [

	^ DTRTDTestCasePriorities 
]

{ #category : 'visiting' }
DTRTDPriorityVisitor >> visitTestSuite: aTestSuite [

	super visitTestSuite: aTestSuite.
	testCasesViewModels do: [ :testCase | self addPrioritiesTo: testCase ]
]
