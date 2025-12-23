"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'MethodMessagesAnalysisResult',
	#superclass : 'Object',
	#instVars : [
		'methods'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'instance creation' }
MethodMessagesAnalysisResult class >> withMethods: aMethodsDictionary [
	^ self new methods: aMethodsDictionary
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> method: aCompiledMethod containsMessage: aMessageSymbol [ 
	^(methods at: aCompiledMethod parseTree ) includes: aMessageSymbol 
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> method: aCompiledMethod containsSubmethod: aCompiledSubmethod [ 
	| methodMessages subMethodMessages |
	methodMessages := methods at: aCompiledMethod parseTree .
	subMethodMessages := methods at: aCompiledSubmethod parseTree .
	^(subMethodMessages anySatisfy: [ :each | (methodMessages includes: each) not ]) not.
	"todo: I do not like double negation"
	 
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> methodMessages: aCompiledMethod [
	^methods at: aCompiledMethod parseTree ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> methods [
	^methods keys 
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> methods: aMethodDictionary [
	methods := aMethodDictionary .
]

{ #category : 'printing' }
MethodMessagesAnalysisResult >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(' ; 
		nextPutAll: methods asString;
		nextPutAll: ')'
]
