"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'AnalysisResult',
	#superclass : 'Object',
	#instVars : [
		'messagesFound'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'instance creation' }
AnalysisResult class >> withMessages: aMessageCollection [
	^ self new messages: aMessageCollection
]

{ #category : 'testing' }
AnalysisResult >> message: aSymbol isRelatedTo: relatedSymbol [
	^ (messagesFound includes:aSymbol ) 
		and: [ (messagesFound includes: relatedSymbol ) ]
]

{ #category : 'accessing' }
AnalysisResult >> messages: aMessageCollection [
	messagesFound := aMessageCollection .
]
