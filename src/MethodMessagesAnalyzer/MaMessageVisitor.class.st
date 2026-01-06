"
I collect messages found through the visited AST
"
Class {
	#name : 'MaMessageVisitor',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'guardedMessages',
		'foundMessages'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaMessageVisitor >> addGuardedMessages: aMessageNode [

	| oldMessages |
	oldMessages := foundMessages.
	foundMessages := Set new.
	aMessageNode arguments do: [ :each | each acceptVisitor: self ].
	guardedMessages addAll: foundMessages.
	foundMessages := oldMessages.
]

{ #category : 'accessing' }
MaMessageVisitor >> foundMessages [ 
	
	^ foundMessages 
]

{ #category : 'accessing' }
MaMessageVisitor >> guardedMessages [ 
	
	^ guardedMessages 
]

{ #category : 'initialization' }
MaMessageVisitor >> initialize [ 

	super initialize.
	foundMessages := Set new.
	guardedMessages := Set new.
]

{ #category : 'visiting' }
MaMessageVisitor >> visitMessageNode: aMessageNode [

	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ self addGuardedMessages: aMessageNode ].
	foundMessages add: aMessageNode selector.
	super visitMessageNode: aMessageNode.
]
