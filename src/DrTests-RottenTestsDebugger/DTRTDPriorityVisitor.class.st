"
I build the view model with `DTRTDTestCasePriorities`
"
Class {
	#name : 'DTRTDPriorityVisitor',
	#superclass : 'DTRTDMessagesVisitor',
	#instVars : [
		'testCases'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'factory' }
DTRTDPriorityVisitor class >> testCaseViewModelClass [

	^ DTRTDTestCasePriorities 
]

{ #category : 'building' }
DTRTDPriorityVisitor >> buildTestCasePriorities: aTestCasePriorities [

	aTestCasePriorities 
		higherPriorityCases: (self buildTestCasesFrom: 
			(methodVisitor messages subMethodsIncludedBy: aTestCasePriorities testMethod)) asOrderedCollection;
		lowerPriorityCases: (self buildTestCasesFrom: 
			(methodVisitor messages methodsThatInclude: aTestCasePriorities testMethod)) asOrderedCollection 
]

{ #category : 'private' }
DTRTDPriorityVisitor >> buildTestCasesFrom: compiledMethods [

	^ compiledMethods collect: [ :compiledMethod | 
		DTRTDTestCaseMessages new 
			messages: (methodVisitor messages at: compiledMethod) asOrderedCollection; 
			testMethod: compiledMethod;
			yourself  ]
]

{ #category : 'building' }
DTRTDPriorityVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesPriorities: testCasesViewModels 
]

{ #category : 'visiting' }
DTRTDPriorityVisitor >> visitTestSuite: aTestSuite [

	super visitTestSuite: aTestSuite.
	testCasesViewModels do: [ :testCase | self buildTestCasePriorities: testCase ]
]
