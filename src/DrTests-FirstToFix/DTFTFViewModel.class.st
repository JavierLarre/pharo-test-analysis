"
I store the analisys result wrapped for DrTest
"
Class {
	#name : 'DTFTFViewModel',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'helpers',
		'selfSentMethods',
		'priorities'
	],
	#category : 'DrTests-FirstToFix-DTOs',
	#package : 'DrTests-FirstToFix',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTFTFViewModel >> helpers [

	^ helpers
]

{ #category : 'accessing' }
DTFTFViewModel >> helpers: anObject [

	helpers := anObject
]

{ #category : 'accessing' }
DTFTFViewModel >> messages [

	^ messages
]

{ #category : 'accessing' }
DTFTFViewModel >> messages: anObject [

	messages := anObject
]

{ #category : 'accessing' }
DTFTFViewModel >> priorities [

	^ priorities
]

{ #category : 'accessing' }
DTFTFViewModel >> priorities: anObject [

	priorities := anObject
]

{ #category : 'accessing' }
DTFTFViewModel >> selfSentMethods [

	^ selfSentMethods 
]

{ #category : 'accessing' }
DTFTFViewModel >> selfSentMethods: anObject [

	selfSentMethods := anObject 
]
