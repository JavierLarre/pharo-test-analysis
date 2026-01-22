"
I analyze test cases using `MaMessageVisitor` and build the view model with the messages found
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
