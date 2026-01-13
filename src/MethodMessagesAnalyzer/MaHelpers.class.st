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
MaHelpers >> atMethod: aCompiledMethod includesHelper: aCompiledHelper [

	^(self helpersOf: aCompiledMethod ) includes: aCompiledHelper 
]

{ #category : 'accessing' }
MaHelpers >> atMethod: aCompiledMethod putHelpers: aHelpersCollection [

	helpers at: aCompiledMethod put: aHelpersCollection 
]

{ #category : 'copying' }
MaHelpers >> copy [ 

	^ self class new
		helpers: helpers copy;
		yourself 
]

{ #category : 'accessing' }
MaHelpers >> helpers [
	
	^helpers 
]

{ #category : 'accessing' }
MaHelpers >> helpers: aHelperCollection [
	
	helpers := aHelperCollection 
]

{ #category : 'accessing' }
MaHelpers >> helpersOf: aCompiledMethod [
	
	^helpers at: aCompiledMethod ifAbsent: [ MethodNotFound signal ]
]

{ #category : 'initialization' }
MaHelpers >> initialize [ 

	super initialize. 
	helpers := Dictionary new.
]
