"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MyTestAnalyzerTest',
	#superclass : 'TestCase',
	#category : 'MyTestAnalyzer-Tests',
	#package : 'MyTestAnalyzer-Tests'
}

{ #category : 'evaluating' }
MyTestAnalyzerTest >> analyzeExpression: anExpression [
	^ MyTestAnalyzer visit: (self parseExpression: anExpression )
]

{ #category : 'parsing' }
MyTestAnalyzerTest >> parseExpression: anExpression [
	^ OCParser parseExpression: anExpression 
]

{ #category : 'tests' }
MyTestAnalyzerTest >> testCascadeMethodsAreRelated [
	| result |
	result := self analyzeExpression: '
	someVariable x y z a b c
	'.
	self assert: (result message: #x isRelatedTo: #c)
]

{ #category : 'tests' }
MyTestAnalyzerTest >> testMethodIsRelatedWithItself [
	| result |
	result := self analyzeExpression: '
		someVariable x.
		someVariable x.
	'.
	self
		assert: (result message: #x isRelatedTo: #x)
]

{ #category : 'tests' }
MyTestAnalyzerTest >> testTwoMessagesAreRelated [
	| result |
	result := self analyzeExpression: '
	someVariable x.
	someVariable y.
	'.
	self
		assert: (result message: #x isRelatedTo: #y)
]
