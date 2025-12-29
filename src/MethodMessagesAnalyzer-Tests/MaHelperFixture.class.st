"
I store helpers that are to be used for analysis in tests
"
Class {
	#name : 'MaHelperFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'as yet unclassified' }
MaHelperFixture >> helper [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> testHelper [
	
	self helper
]
