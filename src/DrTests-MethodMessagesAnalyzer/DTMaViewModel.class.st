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

{ #category : 'initialization' }
DTMaViewModel >> initialize [

	super initialize.
	testCasesMessages := OrderedCollection new
]

{ #category : 'private' }
DTMaViewModel >> testCaseClassBlock [

	^ [ :testCaseMessages | testCaseMessages testCase class ]
]

{ #category : 'accessing' }
DTMaViewModel >> testCasesHelpers [

	^ testCasesHelpers
]

{ #category : 'accessing' }
DTMaViewModel >> testCasesHelpers: anObject [

	testCasesHelpers := anObject
]

{ #category : 'tests' }
DTMaViewModel >> testCasesHelpersByClass [

	^ testCasesHelpers groupedBy: self testCaseClassBlock 
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
DTMaViewModel >> testCasesMessagesByClass [

	^ testCasesMessages groupedBy: self testCaseClassBlock 
]

{ #category : 'tests' }
DTMaViewModel >> testCasesSelfSentMethods [

	^ testCasesSelfSentMethods 
]

{ #category : 'tests' }
DTMaViewModel >> testCasesSelfSentMethods: anObject [

	testCasesSelfSentMethods := anObject 
]

{ #category : 'tests' }
DTMaViewModel >> testCasesSelfSentMethodsByClass [

	^ testCasesSelfSentMethods groupedBy: self testCaseClassBlock
]
