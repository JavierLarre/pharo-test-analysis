"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'AnalysisResult',
	#superclass : 'Object',
	#instVars : [
		'messages'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'instance creation' }
AnalysisResult class >> withMessages: aMessageCollection [
	^ self new messages: aMessageCollection
]

{ #category : 'comparing' }
AnalysisResult >> includes: aSymbol [
	^(messages at: #foo) includes: aSymbol 
]

{ #category : 'testing' }
AnalysisResult >> message: aSymbol isRelatedTo: relatedSymbol [
	^ (self includes: aSymbol ) 
		and: [ self includes: relatedSymbol ]
]

{ #category : 'accessing' }
AnalysisResult >> messages: aMessageMethodDictionary [
	messages := aMessageMethodDictionary .
]

{ #category : 'accessing' }
AnalysisResult >> method: aSymbol [ 
	^messages at: aSymbol 
]

{ #category : 'accessing' }
AnalysisResult >> method: methodSymbol containsMessage: messageSymbol [ 
	^(messages at: methodSymbol ) includes: messageSymbol 
]

{ #category : 'accessing' }
AnalysisResult >> method: method includes: subMethod [ 
	| methodMessages subMethodMessages |
	methodMessages := messages at: method .
	subMethodMessages := messages at: subMethod.
	^(subMethodMessages anySatisfy: [ :each | (methodMessages includes: each) not ]) not.
	"I do not like double negation"
	 
]

{ #category : 'printing' }
AnalysisResult >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(' ; 
		nextPutAll: messages asString;
		nextPutAll: ')'
]
