"
I analyze test cases using `MaHelperVisitor` and build the view model with the visitors found
"
Class {
	#name : 'DTRTDHelperVisitor',
	#superclass : 'DTRTDAnalysisStrategy',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDHelperVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	| compiledMethods |
	super buildMethodViewModel: aMethodViewModel withTestCase: aTestCase.
	compiledMethods := self methodVisitor helpers at: (self testCaseMethod: aTestCase).
	aMethodViewModel
		messages: (compiledMethods collect: #selector)
]

{ #category : 'building' }
DTRTDHelperVisitor >> buildViewModel: aViewModel [

	aViewModel helpers: (self filterEmptyMessages: self methodViewModels )
]

{ #category : 'accessing' }
DTRTDHelperVisitor >> methodVisitor [

	^ methodVisitor ifNil: [ 
			methodVisitor := super methodVisitor
				useAssertableSelectors;
				yourself ]
]

{ #category : 'factory' }
DTRTDHelperVisitor >> methodVisitorClass [

	^ RTDHelperVisitor 
]
