"
I am a leaf node for DrTest that shows a message selector
"
Class {
	#name : 'DTMaMessageNode',
	#superclass : 'Object',
	#instVars : [
		'message',
		'browseMethod'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
DTMaMessageNode >> browseMethod: anObject [

	browseMethod := anObject
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
