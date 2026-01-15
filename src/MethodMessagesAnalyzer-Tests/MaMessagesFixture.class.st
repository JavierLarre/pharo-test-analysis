"
I store pre defined methods for analyzer tests to use
"
Class {
	#name : 'MaMessagesFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MaMessagesFixture class >> foo [

	self xxx yyy
]

{ #category : 'as yet unclassified' }
MaMessagesFixture class >> xxx [
	"empty"
]

{ #category : 'accessing' }
MaMessagesFixture >> a [
	"empty"
]

{ #category : 'accessing' }
MaMessagesFixture >> bar [

	self a b c
]

{ #category : 'as yet unclassified' }
MaMessagesFixture >> callsCycle [

]

{ #category : 'accessing' }
MaMessagesFixture >> callsFoo [

	self foo
]

{ #category : 'accessing' }
MaMessagesFixture >> containedFoo [

	self x.
]

{ #category : 'as yet unclassified' }
MaMessagesFixture >> cycle1 [
]

{ #category : 'as yet unclassified' }
MaMessagesFixture >> cycle2 [
]

{ #category : 'accessing' }
MaMessagesFixture >> foo [

	self x.
	self y.
	self z
]

{ #category : 'accessing' }
MaMessagesFixture >> fooWithAssert [

	self x.
	self y.
	self z.
	self assert: true
]

{ #category : 'accessing' }
MaMessagesFixture >> subContainedFoo [

	self x.
	self y
]

{ #category : 'accessing' }
MaMessagesFixture >> x [
	"empty"
]

{ #category : 'accessing' }
MaMessagesFixture >> y [
	"empty"
]

{ #category : 'accessing' }
MaMessagesFixture >> z [
	"empty"
]
