"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTRTDMethodData',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'compiledMethod',
		'helpers',
		'selfSentMethods'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'comparing' }
DTRTDMethodData >> <= aTestCaseMessages [
	
	self messages size = aTestCaseMessages messages size
		ifFalse: [ ^ self messages size < aTestCaseMessages messages size ] .
	^ self compiledMethod selector <= aTestCaseMessages compiledMethod selector 
]

{ #category : 'accessing' }
DTRTDMethodData >> compiledMethod [

	^ compiledMethod
]

{ #category : 'accessing' }
DTRTDMethodData >> compiledMethod: aCompiledMethod [

	compiledMethod := aCompiledMethod 
]

{ #category : 'accessing' }
DTRTDMethodData >> helpers [

	^ helpers
]

{ #category : 'accessing' }
DTRTDMethodData >> helpers: anObject [

	helpers := anObject
]

{ #category : 'accessing' }
DTRTDMethodData >> messages [

	^ messages ifNil: [ messages := #() ]
]

{ #category : 'accessing' }
DTRTDMethodData >> messages: anObject [

	messages := anObject
]

{ #category : 'printing' }
DTRTDMethodData >> printOn: aStream [

	super printOn: aStream.
	aStream 
		<< ' (';
		print: self compiledMethod;
		<< ')'. 
]

{ #category : 'accessing' }
DTRTDMethodData >> selfSentMethods [

	^ selfSentMethods
]

{ #category : 'accessing' }
DTRTDMethodData >> selfSentMethods: anObject [

	selfSentMethods := anObject
]
