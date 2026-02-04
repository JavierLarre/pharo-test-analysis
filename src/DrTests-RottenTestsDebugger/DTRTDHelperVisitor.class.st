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

{ #category : 'building' }
DTRTDHelperVisitor >> buildViewModel: aViewModel [

	aViewModel helpers: (self filterEmptyMessages: methodViewModels )
]

{ #category : 'initialization' }
DTRTDHelperVisitor >> initialize [ 
	
	super initialize.
	methodVisitor helperSelectors: (TAssertable selectors union: { #assert: . #assert:description: } )
]

{ #category : 'factory' }
DTRTDHelperVisitor >> methodVisitorClass [

	^ RTDHelperVisitor 
]
