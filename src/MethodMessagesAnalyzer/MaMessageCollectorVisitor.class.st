Class {
	#name : 'MaMessageCollectorVisitor',
	#superclass : 'MaMethodVisitor',
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaMessageCollectorVisitor >> guardedMessages [ 
	^ guardedMessages 
]

{ #category : 'accessing' }
MaMessageCollectorVisitor >> messages [
	
	^ messages
]

{ #category : 'visiting' }
MaMessageCollectorVisitor >> visitCompiledMethod: aCompiledMethod [
	
	foundMessages := Set new.
	foundGuardedMessages := Set new.
	isGuarded := false.

	super visitCompiledMethod: aCompiledMethod.
	
	messages atMethod: aCompiledMethod putMessages: foundMessages.
	guardedMessages atMethod: aCompiledMethod putMessages: foundGuardedMessages.
	

]

{ #category : 'visiting' }
MaMessageCollectorVisitor >> visitMessageNode: aMessageNode [

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
MaMessageCollectorVisitor >> visitNodes: aMessageNode [
	
	
]
