"
I am a data structure that encapsulates helpers found by the analyzer
"
Class {
	#name : 'MaHelpers',
	#superclass : 'Object',
	#instVars : [
		'helpers',
		'guardedHelpers'
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
		guardedHelpers: guardedHelpers copy;
		yourself 
]

{ #category : 'accessing' }
MaHelpers >> guardedHelpers [
	
	^ guardedHelpers 
]

{ #category : 'accessing' }
MaHelpers >> guardedHelpers: aHelperCollection [
	
	guardedHelpers := aHelperCollection 
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
	guardedHelpers := Set new
]

{ #category : 'accessing' }
MaHelpers >> isGuarded: aCompiledMethod [ 
	
	^ guardedHelpers includes: aCompiledMethod 
]
