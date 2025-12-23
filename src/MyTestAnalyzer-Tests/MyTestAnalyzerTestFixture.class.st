Class {
	#name : 'MyTestAnalyzerTestFixture',
	#superclass : 'Object',
	#category : 'MyTestAnalyzer-Tests',
	#package : 'MyTestAnalyzer-Tests'
}

{ #category : 'accessing' }
MyTestAnalyzerTestFixture class >> foo [

	self xxx yyy
]

{ #category : 'accessing' }
MyTestAnalyzerTestFixture >> bar [

	self a b c
]

{ #category : 'accessing' }
MyTestAnalyzerTestFixture >> foo [

	self x.
	self y.
	self z
]

{ #category : 'accessing' }
MyTestAnalyzerTestFixture >> fooWithAssert [

	self x.
	self y.
	self z.
	self assert: true
]
