"
I analyze test cases using `MaMethodVisitor` and build the view model with the methods found
"
Class {
	#name : 'DTRTDSelfMethodsVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'testCasesMethods'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'factory' }
DTRTDSelfMethodsVisitor class >> methodVisitorClass [

	^ RTDMethodVisitor 
]

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	| testCaseSelfCalls |
	super buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase.
	testCaseSelfCalls := methodVisitor methodsSelfCalls at: (self testCaseMethod: aTestCase).

	aTestCaseViewModel messages: (testCaseSelfCalls collect: #selector) asOrderedCollection
]

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesSelfSentMethods: (self filterEmptyMessages: testCasesViewModels )
]
