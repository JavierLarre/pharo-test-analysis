"
A TSDTooManyClassesDetectorTest is a test class for testing the behavior of TSDTooManyClassesDetector
"
Class {
	#name : 'TSDTooManyClassesDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'detector'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDTooManyClassesDetectorTest >> setUp [
	super setUp.

	detector := TSDTooManyClassesDetector new
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetectsClasses [

	detector visit: (TSDFakeTests >> #testUsesClasses) parseTree.
	self 
		assertCollection: detector classReferences equals: { #TSDTooManyClassesDetector } asSet;
		assert: detector referencesCount equals: 1
]
