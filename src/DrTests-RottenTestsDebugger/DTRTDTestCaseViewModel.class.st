"
I store the messages and the compiled method of a test case
"
Class {
	#name : 'DTRTDTestCaseViewModel',
	#superclass : 'Object',
	#instVars : [
		'messages',
		'testMethod'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'comparing' }
DTRTDTestCaseViewModel >> <= aTestCaseMessages [
	
	messages size = aTestCaseMessages messages size
		ifFalse: [ ^ messages size < aTestCaseMessages messages size ] .
	^ testMethod selector <= aTestCaseMessages testMethod selector 
]

{ #category : 'initialization' }
DTRTDTestCaseViewModel >> initialize [

	super initialize.
	messages := #().
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> messages [

	^ messages
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> messages: anObject [

	messages := anObject
]

{ #category : 'printing' }
DTRTDTestCaseViewModel >> printOn: aStream [

	super printOn: aStream.
	aStream 
		<< ': ';
		print: testMethod;
		<< ', '.
	messages printElementsOn: aStream. 
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> testMethod [

	^ testMethod
]

{ #category : 'accessing' }
DTRTDTestCaseViewModel >> testMethod: aCompiledMethod [

	testMethod := aCompiledMethod 
]
