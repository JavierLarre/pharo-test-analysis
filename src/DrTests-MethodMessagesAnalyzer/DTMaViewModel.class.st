"
I store the analisys result wrapped for DrTest
"
Class {
	#name : 'DTMaViewModel',
	#superclass : 'Object',
	#instVars : [
		'testCasesMessages',
		'testCasesHelpers',
		'testCasesSelfSentMethods'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-DTOs',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTMaViewModel >> testCasesHelpers [

	^ testCasesHelpers
]

{ #category : 'accessing' }
DTMaViewModel >> testCasesHelpers: anObject [

	testCasesHelpers := anObject
]

{ #category : 'accessing' }
DTMaViewModel >> testCasesMessages [

	^ testCasesMessages
]

{ #category : 'accessing' }
DTMaViewModel >> testCasesMessages: anObject [

	testCasesMessages := anObject
]

{ #category : 'tests' }
DTMaViewModel >> testCasesSelfSentMethods [

	^ testCasesSelfSentMethods 
]

{ #category : 'tests' }
DTMaViewModel >> testCasesSelfSentMethods: anObject [

	testCasesSelfSentMethods := anObject 
]
