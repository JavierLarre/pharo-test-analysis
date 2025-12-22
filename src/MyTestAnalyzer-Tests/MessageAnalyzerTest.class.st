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
MessageAnalyzerTest >> analyzeMethod: aMethodExpression [
	^ analyzer analyzeMethod: ( self parseMethod: aMethodExpression )
]

{ #category : 'parsing' }
MessageAnalyzerTest >> parseMethod: aMethodExpression [
	^ OCParser parseMethod: aMethodExpression 
]

{ #category : 'accessing' }
MessageAnalyzerTest >> result [ 
	^ analyzer result 
]

{ #category : 'running' }
MessageAnalyzerTest >> setUp [
	super setUp.
	analyzer := MessageAnalyzer new
]

{ #category : 'tests' }
MessageAnalyzerTest >> testAnalyzesMethodMessages [
	self analyzeMethod: 'foo
	self x y z.
	self a b c'.
	self assert: (self result method: #foo) equals: { #x . #y . #z . #a . #b . #c } asSet 
]

{ #category : 'tests' }
MessageAnalyzerTest >> testDoesNotIncludeAssert [
	self analyzeMethod: 'foo
	self x.
	var y.
	self assert: (self z x)'.
	self assert: (self result method: #foo containsMessage: #assert:) not
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
