"
I analyze test cases using `TSDAssertionLessDetector` and build the viewmodel with the results found
"
Class {
	#name : 'DTTSDAssertionLessVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'detector'
	],
	#category : 'DrTests-TestSmellsDetector-Visitors',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTTSDAssertionLessVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	super buildMethodViewModel: aMethodViewModel withTestCase: aTestCase.
	aMethodViewModel 
		messages: (self methodVisitor messages at: (self testCaseMethod: aTestCase) )
]

{ #category : 'building' }
DTTSDAssertionLessVisitor >> buildViewModel: aViewModel [

	aViewModel assertionlessTests: (self filterEmptyMessages: self methodViewModels )
]

{ #category : 'accessing' }
DTTSDAssertionLessVisitor >> detector [

	^ detector ifNil: [ 
		detector := TSDAssertionLessDetector new 
			methodVisitor: self methodVisitor; 
			yourself ]
]

{ #category : 'utilities' }
DTTSDAssertionLessVisitor >> filterEmptyMessages: aMethodViewModelCollection [

	^ (super filterEmptyMessages: aMethodViewModelCollection) select: [ :aMethodViewModel | 
		self detector isAssertionLess: aMethodViewModel compiledMethod ]
]

{ #category : 'accessing' }
DTTSDAssertionLessVisitor >> methodVisitor [

	^ methodVisitor ifNil: [ 
			methodVisitor := super methodVisitor
				helperSelectors: (TAssertable selectors union: { #assert:. #assert:description: });
				yourself ]
]

{ #category : 'factory' }
DTTSDAssertionLessVisitor >> methodVisitorClass [

	^ RTDHelperVisitor 
]
