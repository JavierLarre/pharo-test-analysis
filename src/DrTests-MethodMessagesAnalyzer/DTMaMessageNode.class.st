"
I am a leaf node for DrTest that shows a message selector
"
Class {
	#name : 'DTMaMessageNode',
	#superclass : 'DTTreeLeafNode',
	#instVars : [
		'message',
		'browseMethod'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-node',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'node'
}

{ #category : 'instance creation' }
DTMaMessageNode class >> toNodes: messages [

	^ messages collect: [ :message | self new message: message; yourself ]
]

{ #category : 'accessing' }
DTMaMessageNode >> browseMethod: anObject [

	browseMethod := anObject
]

{ #category : 'accessing' }
DTMaMessageNode >> content [

	^ self
]

{ #category : 'actions' }
DTMaMessageNode >> drTestsBrowse [ 
	
	^ browseMethod drTestsBrowse
]

{ #category : 'accessing' }
DTMaMessageNode >> drTestsName [ 
	
	^ self message 
]

{ #category : 'accessing' }
DTMaMessageNode >> message [

	^ message ifNil: [ message := '' ]
]

{ #category : 'accessing' }
DTMaMessageNode >> message: anObject [

	message := anObject
]
