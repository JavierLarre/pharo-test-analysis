Class {
	#name : 'DTMaTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'analysisData',
		'methodVisitor'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
DTMaTestCaseVisitor >> analysisData [

	^ analysisData ifNil: [ analysisData := SortedCollection new ]
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> analysisData: anObject [

	analysisData := anObject
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> methodVisitor [

	^ methodVisitor
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'private' }
DTMaTestCaseVisitor >> testCaseAnaysisVisitor: aTestCase [

	^ methodVisitor analyzeMethod: aTestCase class >> aTestCase selector
]

{ #category : 'visiting' }
DTMaTestCaseVisitor >> visitTestCase: aTestCase [

	methodVisitor analyzeMethod: aTestCase class >> aTestCase selector
]
