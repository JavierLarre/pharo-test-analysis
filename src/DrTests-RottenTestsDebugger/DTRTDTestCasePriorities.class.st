"
I add fields to `DTRTDTestCaseMessages` for storing both lower and higher priority test cases 
"
Class {
	#name : 'DTRTDTestCasePriorities',
	#superclass : 'DTRTDTestCaseMessages',
	#instVars : [
		'lowerPriorityCases',
		'higherPriorityCases'
	],
	#category : 'DrTests-RottenTestsDebugger-DTOs',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'DTOs'
}

{ #category : 'accessing' }
DTRTDTestCasePriorities >> higherPriorityCases [

	^ higherPriorityCases
]

{ #category : 'accessing' }
DTRTDTestCasePriorities >> higherPriorityCases: anObject [

	higherPriorityCases := anObject
]

{ #category : 'accessing' }
DTRTDTestCasePriorities >> lowerPriorityCases [

	^ lowerPriorityCases
]

{ #category : 'accessing' }
DTRTDTestCasePriorities >> lowerPriorityCases: anObject [

	lowerPriorityCases := anObject
]
