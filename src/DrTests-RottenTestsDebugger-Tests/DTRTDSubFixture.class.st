Class {
	#name : 'DTRTDSubFixture',
	#superclass : 'DTRTDFixture',
	#category : 'DrTests-RottenTestsDebugger-Tests-fixture',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'fixture'
}

{ #category : 'asserting' }
DTRTDSubFixture class >> shouldInheritSelectors [ 

	^ true
]

{ #category : 'fixtures' }
DTRTDSubFixture >> helper [ 

	^ self subHelper
]

{ #category : 'fixtures' }
DTRTDSubFixture >> subHelper [ 

	^ self assert: false
]
