"
I store the analisys result wrapped for DrTest
"
Class {
	#name : 'DTMaAnalysisData',
	#superclass : 'Object',
	#instVars : [
		'testCase',
		'analyserVisitor'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
DTMaAnalysisData >> analyserVisitor [

	^ analyserVisitor
]

{ #category : 'accessing' }
DTMaAnalysisData >> analyserVisitor: anObject [

	analyserVisitor := anObject
]

{ #category : 'factory' }
DTMaAnalysisData >> buildMessagesNodes [
	
	^ (analyserVisitor messages methodMessages: (testCase class >> testCase selector) ) collect: [ :message | 
		DTMaMessageNode new message: message; yourself ]
]

{ #category : 'accessing' }
DTMaAnalysisData >> testCase [

	^ testCase
]

{ #category : 'accessing' }
DTMaAnalysisData >> testCase: anObject [

	testCase := anObject
]
