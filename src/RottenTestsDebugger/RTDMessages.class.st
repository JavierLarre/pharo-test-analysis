"
I store the result of the analysis done by `MyTestAnalyzer`
"
Class {
	#name : 'RTDMessages',
	#superclass : 'Object',
	#instVars : [
		'methodsMessages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'comparing' }
RTDMessages >> = aMaMessages [
	
	^ methodsMessages = aMaMessages methodsMessages
]

{ #category : 'accessing' }
RTDMessages >> atMethod: aCompiledMethod [
	^methodsMessages at: aCompiledMethod ifAbsent: [ RTDMethodNotFound signal ]
]

{ #category : 'accessing' }
RTDMessages >> atMethod: aCompiledMethod includesMessage: aSelector [ 

	^ (self atMethod: aCompiledMethod) includes: aSelector 
]

{ #category : 'accessing' }
RTDMessages >> atMethod: aCompiledMethod putMessages: aSelectorCollection [

	methodsMessages at: aCompiledMethod put: aSelectorCollection 
]

{ #category : 'initialization' }
RTDMessages >> initialize [ 
	
	super initialize.
	methodsMessages := Dictionary new.
]

{ #category : 'accessing' }
RTDMessages >> isEmpty [ 

	^ methodsMessages isEmpty 
]

{ #category : 'accessing' }
RTDMessages >> method: aCompiledMethod includesSubmethod: aCompiledSubmethod [ 
	
	| methodMessages subMethodMessages |
	methodMessages := self atMethod: aCompiledMethod.
	subMethodMessages := self atMethod: aCompiledSubmethod.
	^ subMethodMessages inject: true into: [ :isSubset :each | 
		isSubset and: [ methodMessages includes: each ] ]
]

{ #category : 'testing' }
RTDMessages >> method: aCompiledMethod isConnectedToAnyMessage: aMessageCollection [ 
	
	^ aMessageCollection anySatisfy: [ :message | 
		self method: aCompiledMethod isConnectedToMessage: message ]
]

{ #category : 'accessing' }
RTDMessages >> method: aCompiledMethod isConnectedToMessage: aMessage [
 
	^ RTDConnectedMessagesDFS new
		messages: self;
		method: aCompiledMethod isConnectedTo: aMessage 
]

{ #category : 'accessing' }
RTDMessages >> methods [
	
	^ methodsMessages keys
]

{ #category : 'accessing' }
RTDMessages >> methodsIncludedBy: aCompiledMethod [ 
	
	^ (self methods select: [ :compiledMethod | 
			self method: aCompiledMethod includesSubmethod: compiledMethod ])
		difference: { aCompiledMethod }
]

{ #category : 'accessing' }
RTDMessages >> methodsMessages [

	^methodsMessages 
]

{ #category : 'printing' }
RTDMessages >> printOn: aStream [

	super printOn: aStream.
	methodsMessages printElementsOn: aStream 
]
