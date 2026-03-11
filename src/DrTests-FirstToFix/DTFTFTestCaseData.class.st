"
I add fields to `DTRTDTestCaseMessages` for storing both lower and higher priority test cases 
"
Class {
	#name : 'DTFTFTestCaseData',
	#superclass : 'DTFTFMethodData',
	#instVars : [
		'lowerPriorityMethods',
		'testCase'
	],
	#category : 'DrTests-FirstToFix-DTOs',
	#package : 'DrTests-FirstToFix',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTFTFTestCaseData >> lowerPriorityMethods [

	^ lowerPriorityMethods
]

{ #category : 'accessing' }
DTFTFTestCaseData >> lowerPriorityMethods: anObject [

	lowerPriorityMethods := anObject
]

{ #category : 'accessing' }
DTFTFTestCaseData >> testCase [

	^ testCase
]

{ #category : 'accessing' }
DTFTFTestCaseData >> testCase: anObject [

	testCase := anObject
]
