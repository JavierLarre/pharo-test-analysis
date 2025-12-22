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
AnalysisResult >> method: methodName includes: methodSymbol [ 
	^ (messages at: methodName) includes: methodSymbol 
]
