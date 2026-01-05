"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'MaMessages',
	#superclass : 'Object',
	#instVars : [
		'methods'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaMessages >> atMethod: aMethodNode putMessages: aMessageSet [

	methods at: aMethodNode put: aMessageSet 
]

{ #category : 'copying' }
MaMessages >> copy [

	^ self class new
		methods: methods copy;
		yourself
]

{ #category : 'testing' }
MaMessages >> includes: aCompiledMethod [
	^ methods includesKey: aCompiledMethod parseTree 
]

{ #category : 'initialization' }
MaMessages >> initialize [ 
	
	super initialize.
	methods := Dictionary new.
]

{ #category : 'testing' }
MaMessages >> message: aMessage isConnectedTo: targetMessage [

	^ self message: aMessage isConnectedTo: targetMessage visited: Set new .
]

{ #category : 'testing' }
MaMessages >> message: aMessage isConnectedTo: targetMessage visited: visitedSet [

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
MaMessages >> method: aCompiledMethod containsMessage: aMessageSymbol [ 
	^(methods at: aCompiledMethod parseTree ) includes: aMessageSymbol 
]

{ #category : 'accessing' }
MaMessages >> method: aCompiledMethod containsSubmethod: aCompiledSubmethod [ 
	| methodMessages subMethodMessages |
	methodMessages := methods at: aCompiledMethod parseTree .
	subMethodMessages := methods at: aCompiledSubmethod parseTree .
	^subMethodMessages inject: true into: [ :isSubset :each | isSubset and: [ methodMessages includes: each ] ]
	 
]

{ #category : 'accessing' }
MaMessages >> method: aCompiledMethod isConnectedToMessage: aMessage [ 
	^(self method: aCompiledMethod containsMessage: aMessage)
		or: [ (self methodMessages: aCompiledMethod) anySatisfy: [ :each | self message: each isConnectedTo: aMessage ] ] 
]

{ #category : 'accessing' }
MaMessages >> methodMessages: aCompiledMethod [
	^methods at: aCompiledMethod parseTree ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'accessing' }
MaMessages >> methods: aMethodDictionary [
	methods := aMethodDictionary
]

{ #category : 'accessing' }
MaMessages >> methodsAnalyzed [
	^methods keys 
]

{ #category : 'printing' }
MaMessages >> printOn: aStream [

	super printOn: aStream.
	methods printOn: aStream 
]

{ #category : 'removing' }
MaMessages >> removeMessages: aMessageCollection [

	methods keysAndValuesDo: 
		[ :methodNode :methodMessages | 
			methods at: methodNode put: (methodMessages difference: aMessageCollection) ]
]
