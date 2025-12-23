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

{ #category : 'evaluating' }
MessageAnalyzerTest >> analyzeMethod: aCompiledMethod [
	^ analyzer analyzeMethod: aCompiledMethod parseTree
]

{ #category : 'running' }
MessageAnalyzerTest >> setUp [
	super setUp.
	analyzer := MessageAnalyzer new
]

{ #category : 'tests' }
MessageAnalyzerTest >> testAnalyzesMethodMessages [

	| originalMethod |
	originalMethod := MyTestAnalyzerTestFixture >> #foo.

	self analyzeMethod: originalMethod.
	self assert: (analyzer result method: originalMethod parseTree) equals: { #x. #y. #z } asSet
]

{ #category : 'tests' }
MessageAnalyzerTest >> testDoesNotIncludeAssert [

	| originalMethod |
	originalMethod := MyTestAnalyzerTestFixture >> #fooWithAssert.

	self analyzeMethod: originalMethod.
	self assert: (analyzer result method: originalMethod parseTree containsMessage: #assert:) not
]

{ #category : 'tests' }
MessageAnalyzerTest >> testHasTwoFoos [

	| originalMethodInstanceSide originalMethodClassSide |
	originalMethodInstanceSide := MyTestAnalyzerTestFixture >> #foo.
	originalMethodClassSide := MyTestAnalyzerTestFixture class >> #foo.

	self analyzeMethod: originalMethodInstanceSide.
	self analyzeMethod: originalMethodClassSide.

	self assertCollection: (analyzer result method: originalMethodInstanceSide parseTree) hasSameElements: { #x. #y . #z}.
	self assertCollection: (analyzer result method: originalMethodClassSide parseTree) hasSameElements: { #xxx. #yyy }
]

{ #category : 'tests' }
MessageAnalyzerTest >> testInstanceIsMutable [

	| result1 result2 |
	self analyzeMethod: 'foo
	self x .
	self y'.
	result1 := self result .
	self analyzeMethod: 'bar
	self a b c'.
	result2 := self result .
	self 
		assert: result1 ~= result2 .
	self
		assert: result1 methods ~= result2 methods
]

{ #category : 'tests' }
MessageAnalyzerTest >> testMethodIsIncluded [
	self analyzeMethod: 'selector1
	self x y foo'.
	self analyzeMethod: 'selector2
	somevar x.
	somevar y'.
	self assert: (self result method: #selector1 includes: #selector2) .
	self assert: (self result method: #selector2 includes: #selector1) not
	 
]
