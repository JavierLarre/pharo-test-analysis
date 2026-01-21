"
I am a data structure that encapsulates helpers found by the analyzer
"
Class {
	#name : 'MaHelpers',
	#superclass : 'Object',
	#instVars : [
		'helpers'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaHelpers >> atMethod: aCompiledMethod [
	
	^helpers at: aCompiledMethod ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'accessing' }
MaHelpers >> atMethod: aCompiledMethod includesHelper: aCompiledHelper [

	^(self atMethod: aCompiledMethod ) includes: aCompiledHelper 
]

{ #category : 'accessing' }
MaHelpers >> atMethod: aCompiledMethod putHelpers: aHelpersCollection [

	helpers at: aCompiledMethod put: aHelpersCollection 
]

{ #category : 'accessing' }
MaHelpers >> helpers [
	
	^helpers 
]

{ #category : 'accessing' }
MaHelpers >> helpers: aHelperCollection [
	
	helpers := aHelperCollection 
]

{ #category : 'initialization' }
MaHelpers >> initialize [ 

	super initialize. 
	helpers := Dictionary new.
]
