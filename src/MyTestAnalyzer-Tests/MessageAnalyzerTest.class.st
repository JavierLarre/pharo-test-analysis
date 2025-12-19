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
MessageAnalyzerTest >> testRelatedMessagesBetweenMethods [
	| result method1 method2 |
	method1 := self parseExpression: '
	someVariable x.
	someVariable y.
	'.
	method2 := self parseExpression: '
	someVariable x.
	someVariable z.
	'.
	result := MessageAnalyzer new 
	visit: method1 ; 
	visit: method2 ;
	getResult .
	self
		assert: (result message: #y isRelatedTo: #z)
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
