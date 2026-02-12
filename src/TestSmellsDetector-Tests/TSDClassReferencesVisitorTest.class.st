"
A TSDTooManyClassesDetectorTest is a test class for testing the behavior of TSDTooManyClassesDetector
"
Class {
	#name : 'TSDClassReferencesVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDClassReferencesVisitorTest >> setUp [
	super setUp.

	visitor := TSDClassReferencesVisitor new
]

{ #category : 'tests' }
TSDClassReferencesVisitorTest >> testDetectsClasses [

	visitor visit: (TSDFakeTests >> #testUsesClasses) parseTree.
	self 
		assertCollection: visitor classReferences equals: { #TSDClassReferencesVisitor } asSet;
		assert: visitor referencesCount equals: 1
]
