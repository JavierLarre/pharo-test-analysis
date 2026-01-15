"
I find and store self calls that are connected to asserting selectors
"
Class {
	#name : 'MaHelperVisitor',
	#superclass : 'MaMessageVisitor',
	#instVars : [
		'helpers',
		'guardedHelpers',
		'helperSelectors'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaHelperVisitor >> guardedHelpers [ 
	^ guardedHelpers 
]

{ #category : 'accessing' }
MaHelperVisitor >> helperSelectors [

	^ helperSelectors ifNil: [ helperSelectors := OrderedCollection new ]
]

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
	helpers := MaHelpers new.
	guardedHelpers := MaHelpers new.
]

{ #category : 'private' }
MaHelperVisitor >> putHelpersConnectedTo: aCompiledMethod [
	
	helpers 
		atMethod: aCompiledMethod 
		putHelpers: ((methodsSelfCalls at: aCompiledMethod ) select: [ :methodSelfCall | messages method: methodSelfCall  isConnectedToMessage: #assert: ] ).
	guardedHelpers 
		atMethod: aCompiledMethod 
		putHelpers: ( 
			( helpers helpersOf: aCompiledMethod ) select: [ :helper | guardedMessages method: aCompiledMethod containsMessage: helper selector ] ) 
]

{ #category : 'visiting' }
MaHelperVisitor >> visitCompiledMethod: aCompiledMethod [

	| memento |
	memento := self copy.
	helpers := MaHelpers new.
	guardedHelpers := MaHelpers new.
	
	super visitCompiledMethod: aCompiledMethod.
	
	self putHelpersConnectedTo: aCompiledMethod 
]
