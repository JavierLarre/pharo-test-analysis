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

{ #category : 'build' }
DTRTDMessageVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesMessages: testCasesMessages 
]

{ #category : 'comparing' }
DTRTDMessageVisitor >> compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 [

	(methodVisitor messages 
		does: testCaseMessages1 testMethod 
		includesSubMethod: testCaseMessages2 testMethod)
			ifTrue: [ ^ false ].
	(methodVisitor messages 
		does: testCaseMessages2 testMethod 
		includesSubMethod: testCaseMessages1 testMethod)
			ifTrue: [ ^ true ].
	^ testCaseMessages1 <= testCaseMessages2 
	
]

{ #category : 'visiting' }
DTRTDMessageVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.

	super visitTestCase: aTestCase.
	testCasesMessages add: (DTRTDTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: (methodVisitor messages at: compiledMethod) asOrderedCollection ;
			 yourself).
]
