"
I represent an example test suite for visitor tests
"
Class {
	#name : 'DTRTDFixture',
	#superclass : 'Object',
	#category : 'DrTests-RottenTestsDebugger-Tests-fixture',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'fixture'
}

{ #category : 'tests' }
DTRTDFixture >> emptyMethod [

	^ #( a b c)
]

{ #category : 'fixtures' }
DTRTDFixture >> helper [ 

	self assert: false
]

{ #category : 'tests' }
DTRTDFixture >> testAssertionLess [

	^ self emptyMethod 
]

{ #category : 'tests' }
DTRTDFixture >> testHelper [

	self 
		helper;
		emptyMethod 
]

{ #category : 'tests' }
DTRTDFixture >> testMethod [

	self 
		helper; 
		assert: true. 
	self emptyMethod 
]
