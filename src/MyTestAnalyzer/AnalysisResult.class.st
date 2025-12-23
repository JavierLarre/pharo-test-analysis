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
	^ self new methods: aMethodsDictionary copy
]

{ #category : 'accessing' }
AnalysisResult >> method: aCompiledMethod [
	^methods at: aCompiledMethod parseTree 
]

{ #category : 'accessing' }
AnalysisResult >> method: aCompiledMethod containsMessage: aMessageSymbol [ 
	^(methods at: aCompiledMethod parseTree ) includes: aMessageSymbol 
]

{ #category : 'accessing' }
AnalysisResult >> method: aCompiledMethod containsSubmethod: aCompiledSubmethod [ 
	| methodMessages subMethodMessages |
	methodMessages := methods at: aCompiledMethod parseTree .
	subMethodMessages := methods at: aCompiledSubmethod parseTree .
	^(subMethodMessages anySatisfy: [ :each | (methodMessages includes: each) not ]) not.
	"todo: I do not like double negation"
	 
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
