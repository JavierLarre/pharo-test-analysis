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
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

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
]

{ #category : 'private' }
MaHelperVisitor >> putHelpersConnectedTo: aCompiledMethod [
	
	helpers 
		atMethod: aCompiledMethod 
		putHelpers: ((methodsSelfCalls at: aCompiledMethod ) 
			select: [ :methodSelfCall | 
				helperSelectors anySatisfy: [ :helper | 
					messages method: methodSelfCall isConnectedToMessage: helper ] ] )
]

{ #category : 'visiting' }
MaHelperVisitor >> visitCompiledMethod: aCompiledMethod [
	
	super visitCompiledMethod: aCompiledMethod.
	self putHelpersConnectedTo: aCompiledMethod 
]
