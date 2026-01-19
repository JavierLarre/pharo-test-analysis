Class {
	#name : 'DTMaTestCaseMessages',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'messages'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
DTMaTestCaseMessages >> messages [

	^ messages
]

{ #category : 'accessing' }
DTMaTestCaseMessages >> messages: anObject [

	messages := anObject
]

{ #category : 'accessing' }
DTMaTestCaseMessages >> testCase [

	^ testCase
]

{ #category : 'accessing' }
DTMaTestCaseMessages >> testCase: anObject [

	testCase := anObject
]
