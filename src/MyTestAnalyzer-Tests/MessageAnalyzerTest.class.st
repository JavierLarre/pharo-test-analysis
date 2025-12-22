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
MessageAnalyzerTest >> testCascadeMethodsAreRelated [
	| result |
	result := self analyzeMethod: 'foo
	someVariable x y z a b c
	'.
	self assert: (result message: #x isRelatedTo: #c)
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
