"
I store the analisys result wrapped for DrTest
"
Class {
	#name : 'DTMaViewModel',
	#superclass : 'Object',
	#instVars : [
		'testCasesMessages',
		'testCasesHelpers'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'initialization' }
DTMaViewModel >> initialize [

	super initialize.
	testCasesMessages := OrderedCollection new
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

	^ testCasesHelpers groupedBy: [ :testCaseHelpers |
		testCaseHelpers testCase class ]
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

	^ testCasesMessages groupedBy: [ :testCaseMessages |
		testCaseMessages testCase class ]
]
