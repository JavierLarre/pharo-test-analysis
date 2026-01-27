"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTRTDMethodViewModel',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'compiledMethod'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'comparing' }
DTRTDMethodViewModel >> <= aTestCaseMessages [
	
	messages size = aTestCaseMessages messages size
		ifFalse: [ ^ messages size < aTestCaseMessages messages size ] .
	^ compiledMethod selector <= aTestCaseMessages compiledMethod selector 
]

{ #category : 'accessing' }
DTRTDMethodViewModel >> compiledMethod [

	^ compiledMethod
]

{ #category : 'accessing' }
DTRTDMethodViewModel >> compiledMethod: aCompiledMethod [

	compiledMethod := aCompiledMethod 
]

{ #category : 'initialization' }
DTRTDMethodViewModel >> initialize [

	super initialize.
	messages := #().
]

{ #category : 'accessing' }
DTRTDMethodViewModel >> messages [

	^ messages
]

{ #category : 'accessing' }
DTRTDMethodViewModel >> messages: anObject [

	messages := anObject
]

{ #category : 'printing' }
DTRTDMethodViewModel >> printOn: aStream [

	super printOn: aStream.
	aStream 
		<< ': ';
		print: compiledMethod;
		<< ', '.
	messages printElementsOn: aStream. 
]
