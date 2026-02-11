"
I find and store self calls that are connected to asserting selectors
"
Class {
	#name : 'RTDHelperVisitor',
	#superclass : 'RTDMessageVisitor',
	#instVars : [
		'helpers',
		'helperSelectors'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'instance creation' }
RTDHelperVisitor class >> withAssertableSelectors [ 

	^ self new useAssertableSelectors; yourself
]

{ #category : 'accessing' }
RTDHelperVisitor >> helperSelectors [

	^ helperSelectors ifNil: [ helperSelectors := OrderedCollection new ]
]

{ #category : 'accessing' }
RTDHelperVisitor >> helperSelectors: anObject [

	helperSelectors := anObject
]

{ #category : 'accessing' }
RTDHelperVisitor >> helpers [ 
	
	^ helpers ifNil: [ helpers := RTDHelpers new ]
]

{ #category : 'private' }
RTDHelperVisitor >> selectMethodHelpers: aCompiledMethod [

	^ (self methodsSelfCalls at: aCompiledMethod) select: [ :methodSelfCall |
		  messages is: methodSelfCall connectedToAny: self helperSelectors ]
]

{ #category : 'api' }
RTDHelperVisitor >> useAssertableSelectors [

	self helperSelectors: (TAssertable selectors union: #( assert: assert:description: ) ) 
]

{ #category : 'visiting' }
RTDHelperVisitor >> visitMethodNode: aMethodNode [
	
	super visitMethodNode: aMethodNode.
	self helpers at: aMethodNode compiledMethod put: (self selectMethodHelpers: aMethodNode compiledMethod) 
]
