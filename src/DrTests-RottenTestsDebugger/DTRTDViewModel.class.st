"
I store the analisys result wrapped for DrTest
"
Class {
	#name : 'DTRTDViewModel',
	#superclass : 'Object',
	#instVars : [
		'testCasesMessages',
		'testCasesHelpers',
		'testCasesSelfSentMethods'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTRTDViewModel >> testCasesHelpers [

	^ testCasesHelpers
]

{ #category : 'accessing' }
DTRTDViewModel >> testCasesHelpers: anObject [

	testCasesHelpers := anObject
]

{ #category : 'accessing' }
DTRTDViewModel >> testCasesMessages [

	^ testCasesMessages
]

{ #category : 'accessing' }
DTRTDViewModel >> testCasesMessages: anObject [

	testCasesMessages := anObject
]

{ #category : 'accessing' }
DTRTDViewModel >> testCasesSelfSentMethods [

	^ testCasesSelfSentMethods 
]

{ #category : 'accessing' }
DTRTDViewModel >> testCasesSelfSentMethods: anObject [

	testCasesSelfSentMethods := anObject 
]
