Class {
	#name : 'MyNumberTest',
	#superclass : 'ParametrizedTestCase',
	#instVars : [
		'firstOperand',
		'secondOperand',
		'result'
	],
	#category : 'MyTestAnalizer-Tests',
	#package : 'MyTestAnalizer-Tests'
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
	self skip: 'I dont know if its running correctly'.
	sumResult := (firstOperand + secondOperand).
	self assert: sumResult class equals: result class.
	self assert: sumResult number equals: result number
]

{ #category : 'tests' }
MyNumberTest >> testDoubleDispatchNumbers [
	| cases |
	cases := { 
		{ MyInteger fromNumber: 1. MyInteger fromNumber: 2. MyInteger fromNumber: 3 }.
		{ MyFloat fromNumber: 1.1. MyInteger fromNumber: 2. MyFloat fromNumber: 3.1 }.
		{ MyInteger fromNumber: 1. MyFloat fromNumber: 2.1. MyFloat fromNumber: 3.1 }.
		{ MyFloat fromNumber: 1.2. MyFloat fromNumber: 2.1. MyFloat fromNumber: 3.3 }.
		{ MyFraction enum: 1 denom: 2. MyInteger fromNumber: 3. MyFraction enum: 7 denom: 2}.
		{ MyFloat fromNumber: 0.6. MyFraction enum: 2 denom: 5. MyFloat fromNumber: 1}.
		{ MyFraction enum: 1 denom: 3. MyFraction enum: 4 denom: 3. MyFraction enum: 15 denom: 9}
	}.
	cases do: [ :case | self assert: (case first) + (case at: 2) equals: (case last) ]
]
