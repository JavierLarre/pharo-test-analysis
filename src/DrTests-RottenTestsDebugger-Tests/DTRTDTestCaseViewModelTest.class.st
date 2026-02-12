"
A DTRTDTestCaseViewModelTest is a test class for testing the behavior of DTRTDTestCaseViewModel
"
Class {
	#name : 'DTRTDTestCaseViewModelTest',
	#superclass : 'TestCase',
	#instVars : [
		'testCaseViewModel'
	],
	#category : 'DrTests-RottenTestsDebugger-Tests-DTOs',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'DTOs'
}

{ #category : 'tests' }
DTRTDTestCaseViewModelTest >> testPrintOn [

	| result |
	testCaseViewModel := DTRTDMethodData new messages: { #a. #b. #c } asSet.
	result := String streamContents: [ :s | testCaseViewModel printOn: s ].
	({ 'a DTRTDMethodViewModel'. nil. #a. #b. #c } collect: #asString)
		do: [ :subString | self assert: (result includesSubstring: subString) ]
]
