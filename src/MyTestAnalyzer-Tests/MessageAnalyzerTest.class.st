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
MessageAnalyzerTest >> analyzeExpression: anExpression [
	^ MessageAnalyzer visit: (self parseExpression: anExpression )
]

{ #category : 'parsing' }
MessageAnalyzerTest >> parseExpression: anExpression [
	^ OCParser parseExpression: anExpression 
]

{ #category : 'tests' }
MessageAnalyzerTest >> testCascadeMethodsAreRelated [
	| result |
	result := self analyzeExpression: '
	someVariable x y z a b c
	'.
	self assert: (result message: #x isRelatedTo: #c)
]

{ #category : 'tests' }
MessageAnalyzerTest >> testMethodIsRelatedWithItself [
	| result |
	result := self analyzeExpression: '
		someVariable x.
		someVariable x.
	'.
	self
		assert: (result message: #x isRelatedTo: #x)
]

{ #category : 'tests' }
MessageAnalyzerTest >> testTwoMessagesAreRelated [
	| result |
	result := self analyzeExpression: '
	someVariable x.
	someVariable y.
	'.
	self
		assert: (result message: #x isRelatedTo: #y)
]
