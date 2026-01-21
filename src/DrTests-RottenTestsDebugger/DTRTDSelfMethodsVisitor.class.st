"
I analyze test cases using `MaMethodVisitor` and build the view model with the methods found
"
Class {
	#name : 'DTRTDSelfMethodsVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'testCasesMethods'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'build' }
DTRTDSelfMethodsVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesSelfSentMethods: (self filterEmptyMessages: testCasesMethods )
]

{ #category : 'initialization' }
DTRTDSelfMethodsVisitor >> initialize [ 

	super initialize.
	methodVisitor := RTDMethodVisitor new.
	testCasesMethods := SortedCollection new
]

{ #category : 'visiting' }
DTRTDSelfMethodsVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.

	super visitTestCase: aTestCase.
	testCasesMethods add: (DTRTDTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: ((methodVisitor methodsSelfCalls at: compiledMethod) collect: #selector ) asOrderedCollection ;
			 yourself).
]
