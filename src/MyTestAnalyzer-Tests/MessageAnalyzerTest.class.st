"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MessageAnalyzerTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MyTestAnalyzer-Tests',
	#package : 'MyTestAnalyzer-Tests'
}

{ #category : 'running' }
MessageAnalyzerTest >> setUp [
	super setUp.
	analyzer := MessageAnalyzer new
]

{ #category : 'tests' }
MessageAnalyzerTest >> testAnalyzesMethodMessages [

	| originalMethod |
	originalMethod := MyTestAnalyzerTestFixture >> #foo .

	analyzer analyzeMethod: originalMethod .
	self assert: (analyzer result method: originalMethod) equals: { #x. #y. #z } asSet
]

{ #category : 'tests' }
MessageAnalyzerTest >> testDoesNotIncludeAssert [

	| originalMethod |
	originalMethod := MyTestAnalyzerTestFixture >> #fooWithAssert.

	analyzer analyzeMethod: originalMethod.
	self assert: (analyzer result method: originalMethod containsMessage: #assert:) not
]

{ #category : 'tests' }
MessageAnalyzerTest >> testHasTwoFoos [

	| originalMethodInstanceSide originalMethodClassSide |
	originalMethodInstanceSide := MyTestAnalyzerTestFixture >> #foo.
	originalMethodClassSide := MyTestAnalyzerTestFixture class >> #foo.

	analyzer analyzeMethod: originalMethodInstanceSide.
	analyzer analyzeMethod: originalMethodClassSide.

	self assertCollection: (analyzer result method: originalMethodInstanceSide) hasSameElements: { #x. #y . #z}.
	self assertCollection: (analyzer result method: originalMethodClassSide) hasSameElements: { #xxx. #yyy }
]

{ #category : 'tests' }
MessageAnalyzerTest >> testInstanceIsMutable [

	| result1 result2 |
	analyzer analyzeMethod: MyTestAnalyzerTestFixture >> #foo .
	result1 := analyzer result .
	analyzer analyzeMethod: MyTestAnalyzerTestFixture >> #bar .
	result2 := analyzer result .
	self 
		assert: result1 ~= result2 .
	self
		assert: result1 methods ~= result2 methods
]

{ #category : 'tests' }
MessageAnalyzerTest >> testMethodIsIncluded [

	| fooMethod containedFoo |
	fooMethod := MyTestAnalyzerTestFixture >> #foo .
	containedFoo := MyTestAnalyzerTestFixture >> #containedFoo .
	analyzer analyzeMethod: fooMethod .
	analyzer analyzeMethod: containedFoo.
	self assert: (analyzer result method: fooMethod containsSubmethod: containedFoo).
	self assert: (analyzer result method: containedFoo containsSubmethod: fooMethod) not
]
