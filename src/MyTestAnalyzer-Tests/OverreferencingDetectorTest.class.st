"
An OverreferencingDetectorTest is a test class for testing the behavior of OverreferencingDetector
"
Class {
	#name : 'OverreferencingDetectorTest',
	#superclass : 'TestCase',
	#category : 'MyTestAnalyzer-Tests',
	#package : 'MyTestAnalyzer-Tests'
}

{ #category : 'as yet unclassified' }
OverreferencingDetectorTest >> overreferencingExample [
	MyInteger new.
	MyFloat new.
	MyFraction new.
]

{ #category : 'tests' }
OverreferencingDetectorTest >> testOverreferenceDetectsCorrectly [
	| tree |
	tree := ( self class >> #overreferencingExample ) ast .
	self
		assert: (OverreferencingDetector hasTooManyReferences: tree)
]
