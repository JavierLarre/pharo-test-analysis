"
I store pre defined methods for analyzer tests to use
"
Class {
	#name : 'MethodMessagesAnalyzerTestFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MethodMessagesAnalyzerTestFixture class >> foo [

	self xxx yyy
]

{ #category : 'accessing' }
MethodMessagesAnalyzerTestFixture >> bar [

	self a b c
]

{ #category : 'accessing' }
MethodMessagesAnalyzerTestFixture >> containedFoo [

	self x.
]

{ #category : 'accessing' }
MethodMessagesAnalyzerTestFixture >> foo [

	self x.
	self y.
	self z
]

{ #category : 'accessing' }
MethodMessagesAnalyzerTestFixture >> fooWithAssert [

	self x.
	self y.
	self z.
	self assert: true
]
