"
I build the view model with the messages found of each test case
"
Class {
	#name : 'DTRTDMessageVisitor',
	#superclass : 'DTRTDFingerPrintVisitor',
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'building' }
DTRTDMessageVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesMessages: testCasesMessages 
]

{ #category : 'visiting' }
DTRTDMessageVisitor >> visitTestCase: aTestCase [

	super visitTestCase: aTestCase.
	testCasesMessages add: (self buildTestCaseMessages: aTestCase)
]
