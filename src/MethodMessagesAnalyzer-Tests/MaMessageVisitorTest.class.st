Class {
	#name : 'MaMessageVisitorTest',
	#superclass : 'TestCase',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'tests' }
MaMessageVisitorTest >> testHasGuarded [
	
	| visitor |
	visitor := MaMessageVisitor new.
	
	visitor visit: (MaHelperFixture >> #testBigHelperGuarded) parseTree.
	
	self assert: (visitor guardedMessages includes: #bigHelper)
	
]
