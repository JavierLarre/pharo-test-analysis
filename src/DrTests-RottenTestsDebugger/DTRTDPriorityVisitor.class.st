Class {
	#name : 'DTRTDPriorityVisitor',
	#superclass : 'DTRTDFingerPrintVisitor',
	#instVars : [
		'testCases'
	],
	#category : 'DrTests-RottenTestsDebugger',
	#package : 'DrTests-RottenTestsDebugger'
}

{ #category : 'building' }
DTRTDPriorityVisitor >> buildTestCasePriorities: testCase [

	| compiledMethod |
	compiledMethod := testCase class >> testCase selector.
	^ DTRTDTestCasePriorities new
		messages: (methodVisitor messages atMethod: compiledMethod);
		testCase: testCase;
		testMethod: compiledMethod;
		higherPriorityCases: {  };
		lowerPriorityCases: {  };
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
