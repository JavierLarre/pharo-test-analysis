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

{ #category : 'factory' }
DTRTDHelperVisitor class >> methodVisitorClass [

	^ RTDHelperVisitor 
]

{ #category : 'building' }
DTRTDHelperVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	| compiledMethods |
	super buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase.
	compiledMethods := methodVisitor helpers at: (self testCaseMethod: aTestCase).
	aTestCaseViewModel
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
