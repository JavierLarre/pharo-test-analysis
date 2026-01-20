"
I analyze test cases using `MaMethodVisitor` and build the view model with the methods found
"
Class {
	#name : 'DTMaSelfMethodsVisitor',
	#superclass : 'DTMaTestCaseVisitor',
	#instVars : [
		'testCasesMethods'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-visitor',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'visitor'
}

{ #category : 'build' }
DTMaSelfMethodsVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesSelfSentMethods: testCasesMethods 
]

{ #category : 'initialization' }
DTMaSelfMethodsVisitor >> initialize [ 

	super initialize.
	methodVisitor := MaMethodVisitor new.
	testCasesMethods := OrderedCollection new
]

{ #category : 'visiting' }
DTMaSelfMethodsVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.

	super visitTestCase: aTestCase.
	testCasesMethods add: (DTMaTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: ((methodVisitor methodsSelfCalls at: compiledMethod) collect: #selector ) asOrderedCollection ;
			 yourself).
]
