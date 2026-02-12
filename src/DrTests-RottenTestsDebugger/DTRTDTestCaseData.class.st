"
I add fields to `DTRTDTestCaseMessages` for storing both lower and higher priority test cases 
"
Class {
	#name : 'DTRTDTestCaseData',
	#superclass : 'DTRTDMethodData',
	#instVars : [
		'lowerPriorityMethods',
		'testCase'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTRTDTestCaseData >> lowerPriorityMethods [

	^ lowerPriorityMethods
]

{ #category : 'accessing' }
DTRTDTestCaseData >> lowerPriorityMethods: anObject [

	lowerPriorityMethods := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseData >> testCase [

	^ testCase
]

{ #category : 'accessing' }
DTRTDTestCaseData >> testCase: anObject [

	testCase := anObject
]
