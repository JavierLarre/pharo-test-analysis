Class {
	#name : 'MaMessageVisitorTest',
	#superclass : 'MaMethodVisitorTest',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaMessageVisitorTest >> setUp [ 

	super setUp.
	visitor := MaMessageVisitor new
]

{ #category : 'tests' }
MaMessageVisitorTest >> testEmpty [ 

	self
		assertEmpty: visitor messages methodsAnalyzed
]

{ #category : 'tests' }
MaMessageVisitorTest >> testIncludesMessages [
	
	self analyzeMethodFromFixture: #testHelper.
	
	self 
		assertCollection: (visitor messages methodMessages: MaVisitorFixture >> #testHelper)
		includesAll: { #helper . #foo . #notAHelper . #guardedHelper }
]

{ #category : 'tests' }
MaMessageVisitorTest >> testVisitsAreEqual [ 

	| newVisitor |
	self analyzeMethodFromFixture: #testHelper.
	newVisitor := MaMessageVisitor new
		analyzeMethod: (self fixtureMethod: #testHelper);
		yourself.
	
	self 
		assert: visitor messages 
		equals: newVisitor messages
]
