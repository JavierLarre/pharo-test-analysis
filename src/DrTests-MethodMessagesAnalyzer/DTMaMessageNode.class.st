Class {
	#name : 'DTMaMessageNode',
	#superclass : 'Object',
	#instVars : [
		'message'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

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
