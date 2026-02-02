"
A TSDAssignmentFinderTest is a test class for testing the behavior of TSDAssignmentFinder
"
Class {
	#name : 'TSDAssignmentsFinderTest',
	#superclass : 'TSDInstanceVariablesFinderTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDAssignmentsFinderTest >> finder [

	^ self finderClass assignments 
]

{ #category : 'tests' }
TSDAssignmentsFinderTest >> testFindAssignmentVariable [

	finder
		selfClass: TSDSubFixture;
		visit: (TSDSubFixture >> #setUp) parseTree. 
	
	self 
		assertCollection: finder foundVariables 
		equals: { #x . #y . #variableSetUpInSubclassMethod . #variableSetUpInMethod } asSet
]

{ #category : 'tests' }
TSDAssignmentsFinderTest >> testIgnoresNonInstanceVariables [

	self 
		visit: #testDoesNotUsesInstanceVar;
		assertCollection: finder foundVariables equals: Set new
]
