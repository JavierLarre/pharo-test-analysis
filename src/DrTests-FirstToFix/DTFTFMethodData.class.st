"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTFTFMethodData',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'compiledMethod',
		'helpers',
		'selfSentMethods'
	],
	#category : 'DrTests-FirstToFix-DTOs',
	#package : 'DrTests-FirstToFix',
	#tag : 'DTOs'
}

{ #category : 'comparing' }
DTFTFMethodData >> <= aTestCaseMessages [
	
	self messages size = aTestCaseMessages messages size
		ifFalse: [ ^ self messages size < aTestCaseMessages messages size ] .
	^ self compiledMethod selector <= aTestCaseMessages compiledMethod selector 
]

{ #category : 'accessing' }
DTFTFMethodData >> compiledMethod [

	^ compiledMethod
]

{ #category : 'accessing' }
DTFTFMethodData >> compiledMethod: aCompiledMethod [

	compiledMethod := aCompiledMethod 
]

{ #category : 'accessing' }
DTFTFMethodData >> helpers [

	^ helpers
]

{ #category : 'accessing' }
DTFTFMethodData >> helpers: anObject [

	helpers := anObject
]

{ #category : 'accessing' }
DTFTFMethodData >> messages [

	^ messages ifNil: [ messages := #() ]
]

{ #category : 'accessing' }
DTFTFMethodData >> messages: anObject [

	messages := anObject
]

{ #category : 'printing' }
DTFTFMethodData >> printOn: aStream [

	super printOn: aStream.
	aStream 
		<< ' (';
		print: self compiledMethod;
		<< ')'. 
]

{ #category : 'accessing' }
DTFTFMethodData >> selfSentMethods [

	^ selfSentMethods
]

{ #category : 'accessing' }
DTFTFMethodData >> selfSentMethods: anObject [

	selfSentMethods := anObject
]
