"
I store pre defined methods for analyzer tests to use
"
Class {
	#name : 'MethodMessagesAnalyzerFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture class >> foo [

	self xxx yyy
]

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture >> bar [

	self a b c
]

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture >> callsFoo [

	self foo
]

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture >> containedFoo [

	self x.
]

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture >> foo [

	self x.
	self y.
	self z
]

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture >> fooWithAssert [

	self x.
	self y.
	self z.
	self assert: true
]

{ #category : 'accessing' }
MethodMessagesAnalyzerFixture >> subContainedFoo [

	self x.
	self y
]
