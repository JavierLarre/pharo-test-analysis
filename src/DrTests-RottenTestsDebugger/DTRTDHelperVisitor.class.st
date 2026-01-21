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

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.
	
	super visitTestCase: aTestCase.
	testCasesHelpers add: (DTRTDTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: ((methodVisitor helpers atMethod: compiledMethod ) collect: [ :compiledHelper |
				compiledHelper selector ] ) )
]
