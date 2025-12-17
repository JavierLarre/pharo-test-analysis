Class {
	#name : 'MyNumberTest',
	#superclass : 'ParametrizedTestCase',
	#instVars : [
		'firstOperand',
		'secondOperand',
		'result'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'building suites' }
MyNumberTest class >> testParameters [ 
	^ ParametrizedTestMatrix new 
	addCase: { #firstOperand -> (MyInteger fromNumber: 1). #secondOperand -> (MyInteger fromNumber: 2). #result -> (MyInteger fromNumber: 3) };
	addCase: { #firstOperand -> (MyFloat fromNumber: 1.1). #secondOperand -> (MyInteger fromNumber: 2). #result -> (MyFloat fromNumber: 3.1) };
	addCase: { #firstOperand -> (MyInteger fromNumber: 2). #secondOperand -> (MyFloat fromNumber: 1.3). #result -> (MyFloat fromNumber: 3.3) };
	addCase: { #firstOperand -> (MyFloat fromNumber: 1.1). #secondOperand -> (MyFloat fromNumber: 2.2). #result -> (MyFloat fromNumber: 3.3) };
	addCase: { #firstOperand -> (MyFraction enum: 1 denom: 2). #secondOperand -> (MyInteger fromNumber: 3). #result -> (MyFraction enum: 7 denom: 2) }
	yourself 
]

{ #category : 'accessing' }
MyNumberTest >> firstOperand: aNumber [
	firstOperand := aNumber 
]

{ #category : 'accessing' }
MyNumberTest >> result: aNumber [
	result := aNumber 
]

{ #category : 'accessing' }
MyNumberTest >> secondOperand: aNumber [
	secondOperand := aNumber 
]

{ #category : 'tests' }
MyNumberTest >> testAdditions [
	| sumResult |
	sumResult := (firstOperand + secondOperand).
	self assert: sumResult class equals: result class.
	self assert: sumResult number equals: result number
]
