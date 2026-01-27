"
I add fields to `DTRTDTestCaseMessages` for storing both lower and higher priority test cases 
"
Class {
	#name : 'DTRTDPrioritiesViewModel',
	#superclass : 'DTRTDMethodViewModel',
	#instVars : [
		'lowerPriorityMethods'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTRTDPrioritiesViewModel >> lowerPriorityMethods [

	^ lowerPriorityMethods
]

{ #category : 'accessing' }
DTRTDPrioritiesViewModel >> lowerPriorityMethods: anObject [

	lowerPriorityMethods := anObject
]
