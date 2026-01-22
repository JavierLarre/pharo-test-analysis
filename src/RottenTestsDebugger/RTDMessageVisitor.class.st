"
I find and store the messages sent by visited methods, as well as including guarded messages
"
Class {
	#name : 'RTDMessageVisitor',
	#superclass : 'RTDMethodVisitor',
	#instVars : [
		'messages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'initialization' }
RTDMessageVisitor >> initialize [ 

	super initialize.
	
	messages := RTDMessages new.
]

{ #category : 'accessing' }
RTDMessageVisitor >> messages [
	
	^ messages
]

{ #category : 'accessing' }
RTDMessageVisitor >> messages: aMessages [
	
	messages := aMessages 
]

{ #category : 'visiting' }
RTDMessageVisitor >> visitCompiledMethod: aCompiledMethod [
	
	messages 
		at: aCompiledMethod 
		put: (aCompiledMethod parseTree allMessageNodes collect: [ :messageNode | 
			messageNode selector ]) asSet .

	super visitCompiledMethod: aCompiledMethod.
]
