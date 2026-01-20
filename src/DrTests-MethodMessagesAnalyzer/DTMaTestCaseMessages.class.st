"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTMaTestCaseMessages',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'messages',
		'testMethod'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-DTOs',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'DTOs'
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

{ #category : 'accessing' }
DTMaTestCaseMessages >> testMethod [

	^ testMethod
]

{ #category : 'accessing' }
DTMaTestCaseMessages >> testMethod: aCompiledMethod [

	testMethod := aCompiledMethod 
]
