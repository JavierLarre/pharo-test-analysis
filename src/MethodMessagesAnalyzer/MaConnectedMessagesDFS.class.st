"
I travel through `MaMessages` to test if a given method is connected to a target message in the call tree
"
Class {
	#name : 'MaConnectedMessagesDFS',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'visited'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'initialization' }
MaConnectedMessagesDFS >> initialize [ 
	
	super initialize.
	visited := Set new
]

{ #category : 'testing' }
MaConnectedMessagesDFS >> message: aSelector isConnectedTo: targetSelector [

	(visited includes: aSelector )
		ifTrue: [ ^ false ]
		ifFalse: [ visited add: aSelector ].

	^ messages methods anySatisfy: [ :compiledMethod |
		compiledMethod selector = aSelector 
			and: [ self method: compiledMethod isConnectedTo: targetSelector ] ]
]

{ #category : 'accessing' }
MaConnectedMessagesDFS >> messages: aMessages [

	messages := aMessages 
]

{ #category : 'testing' }
MaConnectedMessagesDFS >> method: aCompiledMethod isConnectedTo: aSelector [
	
	^ (messages atMethod: aCompiledMethod includesMessage: aSelector) or: [
		((messages atMethod: aCompiledMethod) anySatisfy: [ :message | 
			self message: message isConnectedTo: aSelector ] ) ]
]
