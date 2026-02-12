"
I analyze test cases using `MaMethodVisitor` and build the view model with the methods found
"
Class {
	#name : 'DTRTDSelfMethodsVisitor',
	#superclass : 'DTRTDAnalysisStrategy',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	| testCaseSelfCalls |
	super buildMethodViewModel: aMethodViewModel withTestCase: aTestCase.
	testCaseSelfCalls := self methodVisitor methodsSelfCalls at: (self testCaseMethod: aTestCase).

	aMethodViewModel 
		messages: (testCaseSelfCalls collect: #selector) 
]

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildViewModel: aViewModel [

	aViewModel selfSentMethods: (self filterEmptyMessages: self methodViewModels )
]

{ #category : 'factory' }
DTRTDSelfMethodsVisitor >> methodVisitorClass [

	^ RTDMethodVisitor 
]
