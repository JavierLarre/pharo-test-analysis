"
I find and store the messages sent by visited methods, as well as including guarded messages
"
Class {
	#name : 'MaMessageVisitor',
	#superclass : 'MaMethodVisitor',
	#instVars : [
		'messages'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'initialization' }
MaMessageVisitor >> initialize [ 

	super initialize.
	
	messages := MaMessages new.
]

{ #category : 'accessing' }
MaMessageVisitor >> messages [
	
	^ messages
]

{ #category : 'visiting' }
MaMessageVisitor >> visitCompiledMethod: aCompiledMethod [
	
	messages 
		atMethod: aCompiledMethod 
		putMessages: (aCompiledMethod parseTree allMessageNodes collect: [ :messageNode | 
			messageNode selector ]) asSet .

	super visitCompiledMethod: aCompiledMethod.
]
