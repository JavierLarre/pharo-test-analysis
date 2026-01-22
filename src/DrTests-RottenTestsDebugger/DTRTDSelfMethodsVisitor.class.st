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

{ #category : 'building' }
DTRTDSelfMethodsVisitor >> buildTestCaseMessages: aTestCase [

	^ (super buildTestCaseMessages: aTestCase )
		messages: ((methodVisitor methodsSelfCalls at: (self testCaseMethod: aTestCase )) collect: #selector ) asOrderedCollection 
]

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

	super visitTestCase: aTestCase.
	testCasesMethods add: (self buildTestCaseMessages: aTestCase )
]
