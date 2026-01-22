Class {
	#name : 'DTRTDPriorityVisitor',
	#superclass : 'DTRTDFingerPrintVisitor',
	#instVars : [
		'testCases'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'building' }
DTRTDPriorityVisitor >> buildTestCasePriorities: aTestCase [

	| compiledMethod messages |
	compiledMethod := self testCaseMethod: aTestCase.
	messages := methodVisitor messages.
	^ DTRTDTestCasePriorities new
		  messages: (messages at: compiledMethod) asOrderedCollection ;
		  testCase: aTestCase;
		  testMethod: compiledMethod;
		  higherPriorityCases: ((messages subMethodsIncludedBy: compiledMethod) collect: [ :method | 
			DTRTDTestCaseMessages new messages: (messages at: method) asOrderedCollection ; testMethod: method; yourself ]) asOrderedCollection ;
		  lowerPriorityCases: ((messages methodsThatInclude: compiledMethod) collect: [ :method | 
			DTRTDTestCaseMessages new messages: (messages at: method) asOrderedCollection ; testMethod: method; yourself ]) asOrderedCollection ;
		  yourself
]

{ #category : 'building' }
DTRTDPriorityVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesPriorities: testCasesMessages 
]

{ #category : 'initialization' }
DTRTDPriorityVisitor >> initialize [ 
	
	super initialize.
	testCases := OrderedCollection new
]

{ #category : 'visiting' }
DTRTDPriorityVisitor >> visitTestCase: aTestCase [

	super visitTestCase: aTestCase.
	testCases add: aTestCase 
]

{ #category : 'visiting' }
DTRTDPriorityVisitor >> visitTestSuite: aTestSuite [

	super visitTestSuite: aTestSuite.
	testCasesMessages := testCases collect: [ :testCase | self buildTestCasePriorities: testCase ]
]
