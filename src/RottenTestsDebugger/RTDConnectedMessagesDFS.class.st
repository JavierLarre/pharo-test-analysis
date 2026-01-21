"
I travel through `MaMessages` to test if a given method is connected to a target message in the call tree
"
Class {
	#name : 'RTDConnectedMessagesDFS',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'visited'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'initialization' }
RTDConnectedMessagesDFS >> initialize [ 
	
	super initialize.
	visited := Set new
]

{ #category : 'testing' }
RTDConnectedMessagesDFS >> message: aSelector isConnectedTo: targetSelector [

	(visited includes: aSelector )
		ifTrue: [ ^ false ]
		ifFalse: [ visited add: aSelector ].

	^ messages methods anySatisfy: [ :compiledMethod |
		compiledMethod selector = aSelector 
			and: [ self method: compiledMethod isConnectedTo: targetSelector ] ]
]

{ #category : 'accessing' }
RTDConnectedMessagesDFS >> messages: aMessages [

	messages := aMessages 
]

{ #category : 'testing' }
RTDConnectedMessagesDFS >> method: aCompiledMethod isConnectedTo: aSelector [
	
	^ (messages atMethod: aCompiledMethod includesMessage: aSelector) or: [
		((messages atMethod: aCompiledMethod) anySatisfy: [ :message | 
			self message: message isConnectedTo: aSelector ] ) ]
]
