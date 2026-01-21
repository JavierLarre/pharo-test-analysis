"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'MaMessages',
	#superclass : 'Object',
	#instVars : [
		'methodsMessages'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'comparing' }
MaMessages >> = aMaMessages [
	
	^ methodsMessages = aMaMessages methodsMessages
]

{ #category : 'accessing' }
MaMessages >> atMethod: aCompiledMethod [
	^methodsMessages at: aCompiledMethod ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'accessing' }
MaMessages >> atMethod: aCompiledMethod includesMessage: aSelector [ 

	^ (self atMethod: aCompiledMethod) includes: aSelector 
]

{ #category : 'accessing' }
MaMessages >> atMethod: aCompiledMethod putMessages: aSelectorCollection [

	methodsMessages at: aCompiledMethod put: aSelectorCollection 
]

{ #category : 'initialization' }
MaMessages >> initialize [ 
	
	super initialize.
	methodsMessages := Dictionary new.
]

{ #category : 'accessing' }
MaMessages >> isEmpty [ 

	^ methodsMessages isEmpty 
]

{ #category : 'testing' }
MaMessages >> message: aMessage isConnectedTo: targetMessage [

	^ self message: aMessage isConnectedTo: targetMessage visited: Set new .
]

{ #category : 'testing' }
MaMessages >> message: aMessage isConnectedTo: targetMessage visited: visitedSet [

	| methodSets |
	methodSets := methodsMessages keys 
		             select: 
							[ :parseTree | 
							(parseTree selector = aMessage) and: [ (visitedSet includes: parseTree selector) not ] ]
		             thenCollect: 
							[ :parseTree | 
							methodsMessages at: parseTree ] .
	^ methodSets anySatisfy: [ :messageSet | 
		(messageSet includes: targetMessage) or: [messageSet anySatisfy: [ :message | 
				self message: message isConnectedTo: targetMessage visited: ( visitedSet copyWith: aMessage ) ]] ]
]

{ #category : 'accessing' }
MaMessages >> method: aCompiledMethod includesSubmethod: aCompiledSubmethod [ 
	
	| methodMessages subMethodMessages |
	methodMessages := self atMethod: aCompiledMethod.
	subMethodMessages := self atMethod: aCompiledSubmethod.
	^ subMethodMessages inject: true into: [ :isSubset :each | 
		isSubset and: [ methodMessages includes: each ] ]
]

{ #category : 'testing' }
MaMessages >> method: aCompiledMethod isConnectedToAnyMessage: aMessageCollection [ 
	
	^ aMessageCollection anySatisfy: [ :message | 
		self method: aCompiledMethod isConnectedToMessage: message ]
]

{ #category : 'accessing' }
MaMessages >> method: aCompiledMethod isConnectedToMessage: aMessage [
 
	^ (self atMethod: aCompiledMethod includesMessage: aMessage) 
		or: [ (self atMethod: aCompiledMethod) anySatisfy: [ :each | 
				self message: each isConnectedTo: aMessage ] ] 
]

{ #category : 'accessing' }
MaMessages >> methodsMessages [

	^methodsMessages 
]

{ #category : 'printing' }
MaMessages >> printOn: aStream [

	super printOn: aStream.
	methodsMessages printElementsOn: aStream 
]
