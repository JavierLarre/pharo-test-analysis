"
I store pre-defined methods for use in analyzer graph tests
"
Class {
	#name : 'MethodMessagesAnalyzerGraphFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MethodMessagesAnalyzerGraphFixture >> cycle1 [
	self cycle2
]

{ #category : 'accessing' }
MethodMessagesAnalyzerGraphFixture >> cycle2 [
	self cycle1
]

{ #category : 'accessing' }
MethodMessagesAnalyzerGraphFixture >> foo [ 
	self y.
	self assert: self bar 
]

{ #category : 'accessing' }
MethodMessagesAnalyzerGraphFixture >> root [
	self x y z
]

{ #category : 'accessing' }
MethodMessagesAnalyzerGraphFixture >> x [ 
	self end
]

{ #category : 'accessing' }
MethodMessagesAnalyzerGraphFixture >> y [ 
	self end 
]
