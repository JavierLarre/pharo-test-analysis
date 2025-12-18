"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MyTestAnalyzerTest',
	#superclass : 'TestCase',
	#category : 'MyTestAnalyzer-Tests',
	#package : 'MyTestAnalyzer-Tests'
}

{ #category : 'parsing' }
MyTestAnalyzerTest >> parseExpression: anExpression [
	^ OCParser parseExpression: anExpression 
]

{ #category : 'tests' }
MyTestAnalyzerTest >> testTwoMessagesAreRelated [
	| result tree |
	tree := self parseExpression: '
	someVariable x.
	someVariable y.
	'.	
	result := MyTestAnalyzer visit: tree.
	self
		assert: (result message: 'x' isRelatedTo: 'y')
]
