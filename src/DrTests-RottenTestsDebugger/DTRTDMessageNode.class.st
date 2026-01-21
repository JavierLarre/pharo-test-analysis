"
I am a leaf node for DrTest that shows a message selector
"
Class {
	#name : 'DTRTDMessageNode',
	#superclass : 'DTAbstractTreeNode',
	#instVars : [
		'message',
		'browseMethod'
	],
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'instance creation' }
DTRTDMessageNode class >> toNodes: messages [

	^ messages collect: [ :message | self new message: message; yourself ]
]

{ #category : 'visiting' }
DTRTDMessageNode >> acceptVisitor: aDTResultsTreeVisitor [
	^ aDTResultsTreeVisitor visitDTTreeLeaf: self
]

{ #category : 'accessing' }
DTRTDMessageNode >> browseMethod: anObject [

	browseMethod := anObject
]

{ #category : 'testing' }
DTRTDMessageNode >> canBeBrowsed [
	^ true
]

{ #category : 'accessing' }
DTRTDMessageNode >> content [

	^ self
]

{ #category : 'actions' }
DTRTDMessageNode >> drTestsBrowse [ 
	
	^ browseMethod drTestsBrowse
]

{ #category : 'accessing' }
DTRTDMessageNode >> drTestsName [ 
	
	^ self message 
]

{ #category : 'testing' }
DTRTDMessageNode >> isLeaf [

	^ true
]

{ #category : 'accessing' }
DTRTDMessageNode >> message [

	^ message ifNil: [ message := '' ]
]

{ #category : 'accessing' }
DTRTDMessageNode >> message: anObject [

	message := anObject
]
