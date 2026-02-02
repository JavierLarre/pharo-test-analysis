"
A TSDAccessInstancesFinderTest is a test class for testing the behavior of TSDAccessInstancesFinder
"
Class {
	#name : 'TSDAccessInstancesFinderTest',
	#superclass : 'TSDInstanceVariablesFinderTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDAccessInstancesFinderTest >> finder [

	^ self finderClass accessings
]

{ #category : 'tests' }
TSDAccessInstancesFinderTest >> testIgnoresLocalVariables [

	self
		visit: #testDoesNotUsesInstanceVar;
		assertCollection: finder foundVariables equals: Set new
]
