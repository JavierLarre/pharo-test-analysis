"
I am a data structure that encapsulates helpers found by the analyzer
"
Class {
	#name : 'MaHelpers',
	#superclass : 'Object',
	#instVars : [
		'methodHelpers'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaHelpers >> atMethod: aCompiledMethod [
	
	^methodHelpers at: aCompiledMethod ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'accessing' }
MaHelpers >> atMethod: aCompiledMethod putHelpers: aHelpersCollection [

	methodHelpers at: aCompiledMethod put: aHelpersCollection 
]

{ #category : 'initialization' }
MaHelpers >> initialize [ 

	super initialize. 
	methodHelpers := Dictionary new.
]

{ #category : 'testing' }
MaHelpers >> isEmpty [ 
	
	^ methodHelpers isEmpty 
]
