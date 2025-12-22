"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MessageAnalyzerTest',
	#superclass : 'TestCase',
	#category : 'MyTestAnalyzer-Tests',
	#package : 'MyTestAnalyzer-Tests'
}

{ #category : 'evaluating' }
MessageAnalyzerTest >> analyzeMethod: aMethodExpression [
	^ MessageAnalyzer visit: (self parseMethod: aMethodExpression )
]

{ #category : 'parsing' }
MessageAnalyzerTest >> parseMethod: aMethodExpression [
	^ OCParser parseMethod: aMethodExpression 
]

{ #category : 'tests' }
MessageAnalyzerTest >> testAnalyzesMethodMessages [
	| result | 
	result := self analyzeMethod: 'foo
	self x y z.
	self a b c'.
	self assert: (result method: #foo) equals: { #x . #y . #z . #a . #b . #c } asSet 
]

{ #category : 'tests' }
MessageAnalyzerTest >> testCascadeMethodsAreRelated [
	| result |
	result := self analyzeMethod: 'foo
	someVariable x y z a b c
	'.
	self assert: (result message: #x isRelatedTo: #c)
]

{ #category : 'tests' }
MessageAnalyzerTest >> testDoesNotIncludeAssert [
	| result |
	result := self analyzeMethod: 'foo
	self x.
	var y.
	self assert: (self z x)'.
	self assert: (result method: #foo containsMessage: #assert:) not
]

{ #category : 'tests' }
MessageAnalyzerTest >> testMethodIsIncluded [
	| method1 method2 result |
	method1 := self parseMethod: 'selector1
	self x y foo'.
	method2 := self parseMethod: 'selector2
	somevar x.
	somevar y'.
	result := MessageAnalyzer new 
		visit: method1;
		visit: method2;
		result .
	self assert: (result method: #selector1 includes: #selector2).
	self assert: (result method: #selector2 includes: #selector1) not.
	 
]

{ #category : 'tests' }
MessageAnalyzerTest >> testMethodIsRelatedWithItself [
	| result |
	result := self analyzeMethod: 'foo
		someVariable x.
	'.
	self
		assert: (result message: #x isRelatedTo: #x)
]

{ #category : 'tests' }
MessageAnalyzerTest >> testTwoMessagesAreRelated [
	| result |
	result := self analyzeMethod: 'foo
	someVariable x.
	someVariable y.
	'.
	self
		assert: (result message: #x isRelatedTo: #y)
]
