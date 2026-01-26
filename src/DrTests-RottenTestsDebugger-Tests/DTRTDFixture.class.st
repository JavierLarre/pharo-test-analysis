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
DTRTDFixture >> testMethod [

	self 
		helper; 
		assert: true. 
	self emptyMethod 
]
