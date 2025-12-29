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

{ #category : 'testing' }
MethodMessagesAnalysisResult >> message: aMessage isConnectedTo: targetMessage [

	^ self message: aMessage isConnectedTo: targetMessage visited: Set new .
]

{ #category : 'testing' }
MethodMessagesAnalysisResult >> message: aMessage isConnectedTo: targetMessage visited: visitedSet [

	| methodSets |
	methodSets := methods keys 
		             select: 
							[ :parseTree | (parseTree selector = aMessage) and: [ (visitedSet includes: parseTree selector) not ] ]
		             thenCollect: 
							[ :parseTree | methods at: parseTree ] .
	^ methodSets 
		anySatisfy: [ :messageSet | (messageSet includes: targetMessage)  
			or: [messageSet anySatisfy: [ :message | self message: message isConnectedTo: targetMessage visited: ( visitedSet copyWith: message ) ]] ]
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
	^subMethodMessages inject: true into: [ :isSubset :each | isSubset and: [ methodMessages includes: each ] ]
	 
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> method: aCompiledMethod isConnectedToMessage: aMessage [ 
	^(self method: aCompiledMethod containsMessage: aMessage)
		or: [ (self methodMessages: aCompiledMethod) anySatisfy: [ :each | self message: each isConnectedTo: aMessage ] ] 
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> methodMessages: aCompiledMethod [
	^methods at: aCompiledMethod parseTree ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> methods: aMethodDictionary [
	methods := aMethodDictionary .
]

{ #category : 'accessing' }
MethodMessagesAnalysisResult >> methodsAnalyzed [
	^methods keys 
]

{ #category : 'printing' }
MethodMessagesAnalysisResult >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(' ; 
		nextPutAll: methods asString;
		nextPutAll: ')'
]
