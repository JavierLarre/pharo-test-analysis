"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTRTDTestCaseViewModel',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'testCase',
		'testMethod'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'comparing' }
DTRTDTestCaseViewModel >> <= aTestCaseMessages [
	
	messages size = aTestCaseMessages messages size
		ifFalse: [ ^ messages size < aTestCaseMessages messages size ] .
	^ testCase selector <= aTestCaseMessages testCase selector 
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> messages [

	^ messages
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> messages: anObject [

	messages := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> testCase [

	^ testCase
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> testCase: anObject [

	testCase := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> testMethod [

	^ testMethod
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> testMethod: aCompiledMethod [

	testMethod := aCompiledMethod 
]
