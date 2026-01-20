"
I am a visitor of test cases that analyses a test method using the given analyzer
"
Class {
	#name : 'DTMaTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'methodVisitor'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-visitor',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'visitor'
}

{ #category : 'build' }
DTMaTestCaseVisitor >> buildViewModel: aViewModel [

	
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> methodVisitor [

	^ methodVisitor
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'visiting' }
DTMaTestCaseVisitor >> visitTestCase: aTestCase [

	methodVisitor analyzeMethod: aTestCase class >> aTestCase selector.
]
