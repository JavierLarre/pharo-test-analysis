Class {
	#name : 'DTMaHelperVisitor',
	#superclass : 'DTMaTestCaseVisitor',
	#instVars : [
		'testCasesHelpers'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'build' }
DTMaHelperVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesHelpers: testCasesHelpers 
]

{ #category : 'initialization' }
DTMaHelperVisitor >> initialize [ 
	
	super initialize.
	methodVisitor := MaHelperVisitor new
		helperSelectors: TAssertable selectors;
		yourself.
	testCasesHelpers := OrderedCollection new
]

{ #category : 'accessing' }
DTMaHelperVisitor >> testCasesHelpers [

	^ testCasesHelpers
]

{ #category : 'visiting' }
DTMaHelperVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.
	
	super visitTestCase: aTestCase.
	testCasesHelpers add: (DTMaTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: ((methodVisitor helpers helpersOf: compiledMethod ) collect: [ :compiledHelper |
				compiledHelper selector ] ) )
]
