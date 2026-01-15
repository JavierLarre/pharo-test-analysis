Class {
	#name : 'MaMessageVisitor',
	#superclass : 'MaMethodVisitor',
	#instVars : [
		'foundGuardedMessages',
		'foundMessages',
		'guardedMessages',
		'isGuarded',
		'messages'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaMessageVisitor >> foundGuardedMessages [

	^foundGuardedMessages 
]

{ #category : 'accessing' }
MaMessageVisitor >> foundMessages [ 
	
	^foundMessages 
]

{ #category : 'accessing' }
MaMessageVisitor >> guardedMessages [ 
	^ guardedMessages 
]

{ #category : 'initialization' }
MaMessageVisitor >> initialize [ 

	super initialize.
	
	foundMessages := Set new.
	foundGuardedMessages := Set new.
	guardedMessages := MaMessages new.
	messages := MaMessages new.
]

{ #category : 'accessing' }
MaMessageVisitor >> isGuarded [ 

	^ isGuarded 
]

{ #category : 'accessing' }
MaMessageVisitor >> messages [
	
	^ messages
]

{ #category : 'visiting' }
MaMessageVisitor >> visitCompiledMethod: aCompiledMethod [
	
	| memento |
	memento := self copy.
	foundMessages := Set new.
	foundGuardedMessages := Set new.
	isGuarded := false.

	super visitCompiledMethod: aCompiledMethod.
	
	messages atMethod: aCompiledMethod putMessages: foundMessages.
	guardedMessages atMethod: aCompiledMethod putMessages: foundGuardedMessages.
	foundMessages := memento foundMessages.
	foundGuardedMessages := memento foundGuardedMessages.
	isGuarded := memento isGuarded 
]

{ #category : 'visiting' }
MaMessageVisitor >> visitMessageNode: aMessageNode [

	| previousIsGuarded |
	previousIsGuarded := isGuarded.
	foundMessages add: aMessageNode selector.
	isGuarded ifTrue: [ foundGuardedMessages add: aMessageNode selector ].
	({ #ifTrue: . #ifFalse: } includes: aMessageNode selector)
		ifTrue: [ isGuarded := true ].
	
	aMessageNode arguments do: [ :each | each acceptVisitor: self ].
	isGuarded := previousIsGuarded.
	aMessageNode receiver acceptVisitor: self.
	super visitMessageNode: aMessageNode.
]

{ #category : 'visiting' }
MaMessageVisitor >> visitNodes: aMessageNode [
	
	
]
