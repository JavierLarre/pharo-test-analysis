"
I analyze test cases using `MaHelperVisitor` and build the view model with the visitors found
"
Class {
	#name : 'DTRTDHelperVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDHelperVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	| compiledMethods |
	super buildMethodViewModel: aMethodViewModel withTestCase: aTestCase.
	compiledMethods := methodVisitor helpers at: (self testCaseMethod: aTestCase).
	aMethodViewModel
		messages: (compiledMethods collect: #selector)
]

{ #category : 'build' }
DTRTDHelperVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesHelpers: (self filterEmptyMessages: testCasesViewModels )
]

{ #category : 'initialization' }
DTRTDHelperVisitor >> initialize [ 
	
	super initialize.
	methodVisitor helperSelectors: TAssertable selectors
]

{ #category : 'factory' }
DTRTDHelperVisitor >> methodVisitorClass [

	^ RTDHelperVisitor 
]
