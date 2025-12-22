"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'AnalysisResult',
	#superclass : 'Object',
	#instVars : [
		'methods'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'instance creation' }
AnalysisResult class >> withMethods: aMethodsDictionary [
	^ self new methods: aMethodsDictionary
]

{ #category : 'accessing' }
AnalysisResult >> method: aSymbol [ 
	^methods at: aSymbol 
]

{ #category : 'accessing' }
AnalysisResult >> method: methodSymbol containsMessage: messageSymbol [ 
	^(methods at: methodSymbol ) includes: messageSymbol 
]

{ #category : 'accessing' }
AnalysisResult >> method: method includes: subMethod [ 
	| methodMessages subMethodMessages |
	methodMessages := methods at: method .
	subMethodMessages := methods at: subMethod.
	^(subMethodMessages anySatisfy: [ :each | (methodMessages includes: each) not ]) not.
	"I do not like double negation"
	 
]

{ #category : 'accessing' }
AnalysisResult >> methods [
	^methods keys 
]

{ #category : 'accessing' }
AnalysisResult >> methods: aMethodDictionary [
	methods := aMethodDictionary .
]

{ #category : 'printing' }
AnalysisResult >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(' ; 
		nextPutAll: methods asString;
		nextPutAll: ')'
]
