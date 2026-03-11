"
I am a leaf node for DrTest that shows a message selector
"
Class {
	#name : 'DTFTFMessageNode',
	#superclass : 'DTTreeLeafNode',
	#instVars : [
		'message',
		'browseMethod'
	],
	#category : 'DrTests-FirstToFix-Builders',
	#package : 'DrTests-FirstToFix',
	#tag : 'Builders'
}

{ #category : 'instance creation' }
DTFTFMessageNode class >> toNodes: messages [

	^ (messages collect: [ :message | self new message: message; yourself ]) asOrderedCollection 
]

{ #category : 'accessing' }
DTFTFMessageNode >> browseMethod: anObject [

	browseMethod := anObject
]

{ #category : 'accessing' }
DTFTFMessageNode >> content [

	^ self
]

{ #category : 'actions' }
DTFTFMessageNode >> drTestsBrowse [ 
	
	^ browseMethod drTestsBrowse
]

{ #category : 'accessing' }
DTFTFMessageNode >> drTestsName [ 
	
	^ message
]

{ #category : 'accessing' }
DTFTFMessageNode >> message [

	^ message
]

{ #category : 'accessing' }
DTFTFMessageNode >> message: anObject [

	message := anObject
]
