"
I store the analisys result wrapped for DrTest
"
Class {
	#name : 'DTRTDViewModel',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'helpers',
		'selfSentMethods',
		'priorities'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTRTDViewModel >> helpers [

	^ helpers
]

{ #category : 'accessing' }
DTRTDViewModel >> helpers: anObject [

	helpers := anObject
]

{ #category : 'accessing' }
DTRTDViewModel >> messages [

	^ messages
]

{ #category : 'accessing' }
DTRTDViewModel >> messages: anObject [

	messages := anObject
]

{ #category : 'accessing' }
DTRTDViewModel >> priorities [

	^ priorities
]

{ #category : 'accessing' }
DTRTDViewModel >> priorities: anObject [

	priorities := anObject
]

{ #category : 'accessing' }
DTRTDViewModel >> selfSentMethods [

	^ selfSentMethods 
]

{ #category : 'accessing' }
DTRTDViewModel >> selfSentMethods: anObject [

	selfSentMethods := anObject 
]
