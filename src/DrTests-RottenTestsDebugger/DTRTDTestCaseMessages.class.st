"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTRTDTestCaseMessages',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'messages',
		'testMethod'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'comparing' }
DTRTDTestCaseMessages >> <= aTestCaseMessages [
	
	messages size = aTestCaseMessages messages size
		ifFalse: [ ^ messages size < aTestCaseMessages messages size ] .
	^ testCase selector <= aTestCaseMessages testCase selector 
]

{ #category : 'accessing' }
DTRTDTestCaseMessages >> messages [

	^ messages
]

{ #category : 'accessing' }
DTRTDTestCaseMessages >> messages: anObject [

	messages := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseMessages >> testCase [

	^ testCase
]

{ #category : 'accessing' }
DTRTDTestCaseMessages >> testCase: anObject [

	testCase := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseMessages >> testMethod [

	^ testMethod
]

{ #category : 'accessing' }
DTRTDTestCaseMessages >> testMethod: aCompiledMethod [

	testMethod := aCompiledMethod 
]
