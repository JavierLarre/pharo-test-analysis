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

	^ detector ifNil: [ detector := TSDAssertionLessDetector new ]
]

{ #category : 'utilities' }
DTRTDAssertionLessVisitor >> filterEmptyMessages: aMethodViewModelCollection [

	^ (super filterEmptyMessages: aMethodViewModelCollection) select: [ :aMethodViewModel | detector isAssertionLess: aMethodViewModel compiledMethod ]
]

{ #category : 'initialization' }
DTRTDAssertionLessVisitor >> initialize [

	super initialize.
	self detector methodVisitor: self methodVisitor
]

{ #category : 'factory' }
DTRTDAssertionLessVisitor >> methodVisitorClass [

	^ RTDHelperVisitor 
]
