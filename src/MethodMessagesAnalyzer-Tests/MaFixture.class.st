"
I store pre defined methods for analyzer tests to use
"
Class {
	#name : 'MaFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MaFixture class >> foo [

	self xxx yyy
]

{ #category : 'as yet unclassified' }
MaFixture class >> xxx [
	"empty"
]

{ #category : 'accessing' }
MaFixture >> a [
	"empty"
]

{ #category : 'accessing' }
MaFixture >> bar [

	self a b c
]

{ #category : 'accessing' }
MaFixture >> callsFoo [

	self foo
]

{ #category : 'accessing' }
MaFixture >> containedFoo [

	self x.
]

{ #category : 'accessing' }
MaFixture >> foo [

	self x.
	self y.
	self z
]

{ #category : 'accessing' }
MaFixture >> fooWithAssert [

	self x.
	self y.
	self z.
	self assert: true
]

{ #category : 'accessing' }
MaFixture >> subContainedFoo [

	self x.
	self y
]

{ #category : 'accessing' }
MaFixture >> x [
	"empty"
]

{ #category : 'accessing' }
MaFixture >> y [
	"empty"
]

{ #category : 'accessing' }
MaFixture >> z [
	"empty"
]
