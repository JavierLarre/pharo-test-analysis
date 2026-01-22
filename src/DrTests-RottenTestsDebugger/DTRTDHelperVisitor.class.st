"
I analyze test cases using `MaHelperVisitor` and build the view model with the visitors found
"
Class {
	#name : 'DTRTDHelperVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'factory' }
DTRTDHelperVisitor class >> methodVisitorClass [

	^ RTDHelperVisitor 
]

{ #category : 'building' }
DTRTDHelperVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	super buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase.
	aTestCaseViewModel
		messages: ((methodVisitor helpers 
			at: (self testCaseMethod: aTestCase )) 
			collect: #selector
		) asOrderedCollection
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
