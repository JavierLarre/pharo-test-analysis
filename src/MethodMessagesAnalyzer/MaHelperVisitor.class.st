Class {
	#name : 'MaHelperVisitor',
	#superclass : 'MaMessageCollectorVisitor',
	#instVars : [
		'helpers',
		'guardedHelpers'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'api' }
MaHelperVisitor >> analyzeMethod: aCompiledMethod [

	super analyzeMethod: aCompiledMethod.
	
	self putHelpersConnectedTo: aCompiledMethod.
	selfSentMethods do: [ :each | self putHelpersConnectedTo: each ]
]

{ #category : 'accessing' }
MaHelperVisitor >> guardedHelpers [ 
	^ guardedHelpers 
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
		putHelpers: (messages methodsFrom: aCompiledMethod thatAreConectedTo: #assert:).
	guardedHelpers 
		atMethod: aCompiledMethod 
		putHelpers: ( 
			( helpers helpersOf: aCompiledMethod ) select: [ :helper | guardedMessages method: aCompiledMethod containsMessage: helper selector ] ) 
]
