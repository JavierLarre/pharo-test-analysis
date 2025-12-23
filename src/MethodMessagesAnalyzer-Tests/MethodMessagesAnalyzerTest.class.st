"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MethodMessagesAnalyzerTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MethodMessagesAnalyzerTest >> setUp [
	super setUp.
	analyzer := MethodMessagesAnalyzer new
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testAnalyzesMethodMessages [

	| originalMethod |
	originalMethod := MethodMessagesAnalyzerTestFixture >> #foo .

	analyzer analyzeMethod: originalMethod .
	self assert: (analyzer result methodMessages: originalMethod) equals: { #x. #y. #z } asSet
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testDoesNotIncludeAssert [

	| originalMethod |
	originalMethod := MethodMessagesAnalyzerTestFixture >> #fooWithAssert.

	analyzer analyzeMethod: originalMethod.
	self assert: (analyzer result method: originalMethod containsMessage: #assert:) not
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testEmptyAnalyzer [

	self assertEmpty: (analyzer result methods) .
	self should: [ analyzer result methodMessages: (MethodMessagesAnalyzerTestFixture >> #foo) ] raise: MethodNotFound
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testHasTwoFoos [

	| instanceSideMethod classSideMethod |
	instanceSideMethod := MethodMessagesAnalyzerTestFixture >> #foo.
	classSideMethod := MethodMessagesAnalyzerTestFixture class >> #foo.

	analyzer analyzeMethod: instanceSideMethod.
	analyzer analyzeMethod: classSideMethod.

	self assertCollection: (analyzer result methodMessages: instanceSideMethod) hasSameElements: { #x. #y . #z}.
	self assertCollection: (analyzer result methodMessages: classSideMethod) hasSameElements: { #xxx. #yyy }
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testInstanceIsMutable [

	| result1 result2 |
	analyzer analyzeMethod: MethodMessagesAnalyzerTestFixture >> #foo .
	result1 := analyzer result .
	analyzer analyzeMethod: MethodMessagesAnalyzerTestFixture >> #bar .
	result2 := analyzer result .
	self 
		assert: result1 ~= result2 .
	self
		assert: result1 methods ~= result2 methods
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testMethodIsIncluded [

	| fooMethod containedFoo |
	fooMethod := MethodMessagesAnalyzerTestFixture >> #foo .
	containedFoo := MethodMessagesAnalyzerTestFixture >> #containedFoo .
	analyzer analyzeMethod: fooMethod .
	analyzer analyzeMethod: containedFoo.
	self assert: (analyzer result method: fooMethod containsSubmethod: containedFoo).
	self assert: (analyzer result method: containedFoo containsSubmethod: fooMethod) not
]
