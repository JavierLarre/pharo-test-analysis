"
I analyze test cases using `MaHelperVisitor` and build the view model with the visitors found
"
Class {
	#name : 'DTRTDHelperVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'testCasesHelpers'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'building' }
DTRTDHelperVisitor >> buildTestCaseMessages: aTestCase [

	^ (super buildTestCaseMessages: aTestCase)
		messages: ((methodVisitor helpers at: (self testCaseMethod: aTestCase )) collect: #selector ) asOrderedCollection ;
		yourself 
]

{ #category : 'build' }
DTRTDHelperVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesHelpers: (self filterEmptyMessages: testCasesHelpers )
]

{ #category : 'initialization' }
DTRTDHelperVisitor >> initialize [ 
	
	super initialize.
	methodVisitor := MaHelperVisitor new
		helperSelectors: TAssertable selectors;
		yourself.
	testCasesHelpers := SortedCollection new
]

{ #category : 'visiting' }
DTRTDHelperVisitor >> visitTestCase: aTestCase [

	super visitTestCase: aTestCase.
	testCasesHelpers add: ( self buildTestCaseMessages: aTestCase )
]
