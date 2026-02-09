"
I analyze test cases using `TSDAssertionLessDetector` and build the viewmodel with the results found
"
Class {
	#name : 'DTRTDAssertionLessVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'detector'
	],
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDAssertionLessVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	super buildMethodViewModel: aMethodViewModel withTestCase: aTestCase.
	aMethodViewModel 
		messages: (self methodVisitor messages at: (self testCaseMethod: aTestCase) )
]

{ #category : 'building' }
DTRTDAssertionLessVisitor >> buildViewModel: aViewModel [

	aViewModel assertionlessTests: (self filterEmptyMessages: self methodViewModels )
]

{ #category : 'accessing' }
DTRTDAssertionLessVisitor >> detector [

	^ detector ifNil: [ 
		detector := TSDAssertionLessDetector new 
			methodVisitor: self methodVisitor; 
			yourself ]
]

{ #category : 'utilities' }
DTRTDAssertionLessVisitor >> filterEmptyMessages: aMethodViewModelCollection [

	^ (super filterEmptyMessages: aMethodViewModelCollection) select: [ :aMethodViewModel | 
		self detector isAssertionLess: aMethodViewModel compiledMethod ]
]

{ #category : 'accessing' }
DTRTDAssertionLessVisitor >> methodVisitor [

	^ methodVisitor ifNil: [ 
			methodVisitor := super methodVisitor
				helperSelectors: (TAssertable selectors union: { #assert:. #assert:description: });
				yourself ]
]

{ #category : 'factory' }
DTRTDAssertionLessVisitor >> methodVisitorClass [

	^ RTDHelperVisitor 
]
