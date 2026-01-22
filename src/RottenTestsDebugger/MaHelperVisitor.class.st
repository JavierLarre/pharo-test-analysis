"
I find and store self calls that are connected to asserting selectors
"
Class {
	#name : 'MaHelperVisitor',
	#superclass : 'MaMessageVisitor',
	#instVars : [
		'helpers',
		'helperSelectors'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'accessing' }
MaHelperVisitor >> helperSelectors: anObject [

	helperSelectors := anObject
]

{ #category : 'accessing' }
MaHelperVisitor >> helpers [ 
	
	^ helpers 
]

{ #category : 'initialization' }
MaHelperVisitor >> initialize [ 

	super initialize.
	helpers := RTDHelpers new.
]

{ #category : 'private' }
MaHelperVisitor >> selectMethodHelpers: aCompiledMethod [

	^ (methodsSelfCalls at: aCompiledMethod) select: [ :methodSelfCall |
		  messages is: methodSelfCall connectedToAny: helperSelectors ]
]

{ #category : 'visiting' }
MaHelperVisitor >> visitCompiledMethod: aCompiledMethod [
	
	super visitCompiledMethod: aCompiledMethod.
	helpers at: aCompiledMethod put: (self selectMethodHelpers: aCompiledMethod) 
]
