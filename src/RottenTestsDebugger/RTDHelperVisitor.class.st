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

{ #category : 'accessing' }
RTDHelperVisitor >> helperSelectors: anObject [

	helperSelectors := anObject
]

{ #category : 'accessing' }
RTDHelperVisitor >> helpers [ 
	
	^ helpers 
]

{ #category : 'initialization' }
RTDHelperVisitor >> initialize [ 

	super initialize.
	helpers := RTDHelpers new.
]

{ #category : 'private' }
RTDHelperVisitor >> selectMethodHelpers: aCompiledMethod [

	^ (methodsSelfCalls at: aCompiledMethod) select: [ :methodSelfCall |
		  messages is: methodSelfCall connectedToAny: helperSelectors ]
]

{ #category : 'visiting' }
RTDHelperVisitor >> visitCompiledMethod: aCompiledMethod [
	
	super visitCompiledMethod: aCompiledMethod.
	helpers at: aCompiledMethod put: (self selectMethodHelpers: aCompiledMethod) 
]
