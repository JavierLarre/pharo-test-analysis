Class {
	#name : 'MaHelperVisitor',
	#superclass : 'MaMessageVisitor',
	#instVars : [
		'helpers',
		'guardedHelpers'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

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

{ #category : 'visiting' }
MaHelperVisitor >> visitCompiledMethod: aCompiledMethod [

	| memento |
	memento := self copy.
	helpers := MaHelpers new.
	guardedHelpers := MaHelpers new.
	
	super visitCompiledMethod: aCompiledMethod.
	
	self putHelpersConnectedTo: aCompiledMethod 
]
