"
I analyze test cases using `MaMethodVisitor` and build the view model with the methods found
"
Class {
	#name : 'DTRTDSelfMethodsVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	| testCaseSelfCalls |
	super buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase.
	testCaseSelfCalls := methodVisitor methodsSelfCalls at: (self testCaseMethod: aTestCase).

	aTestCaseViewModel 
		messages: (testCaseSelfCalls collect: #selector) 
]

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesSelfSentMethods: (self filterEmptyMessages: testCasesViewModels )
]

{ #category : 'factory' }
DTRTDSelfMethodsVisitor >> methodVisitorClass [

	^ RTDMethodVisitor 
]
