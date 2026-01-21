"
I find and store the messages sent by visited methods, as well as including guarded messages
"
Class {
	#name : 'MaMessageVisitor',
	#superclass : 'RTDMethodVisitor',
	#instVars : [
		'messages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'initialization' }
MaMessageVisitor >> initialize [ 

	super initialize.
	
	messages := RTDMessages new.
]

{ #category : 'accessing' }
MaMessageVisitor >> messages [
	
	^ messages
]

{ #category : 'accessing' }
MaMessageVisitor >> messages: aMessages [
	
	messages := aMessages 
]

{ #category : 'visiting' }
MaMessageVisitor >> visitCompiledMethod: aCompiledMethod [
	
	messages 
		atMethod: aCompiledMethod 
		putMessages: (aCompiledMethod parseTree allMessageNodes collect: [ :messageNode | 
			messageNode selector ]) asSet .

	super visitCompiledMethod: aCompiledMethod.
]
