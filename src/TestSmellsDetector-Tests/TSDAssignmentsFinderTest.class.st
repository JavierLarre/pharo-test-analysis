"
A TSDAssignmentFinderTest is a test class for testing the behavior of TSDAssignmentFinder
"
Class {
	#name : 'TSDAssignmentsFinderTest',
	#superclass : 'TSDFixtureTest',
	#instVars : [
		'finder'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'as yet unclassified' }
TSDAssignmentsFinderTest >> fixtureClass [

	^ TSDFixture 
]

{ #category : 'running' }
TSDAssignmentsFinderTest >> setUp [
	super setUp.

	finder := TSDAssignmentsFinder new
		selfClass: self fixtureClass; 
		yourself
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

	finder
		visit: (self fixtureClass >> #testDoesNotUsesInstanceVar ) parseTree. 
	
	self 
		assertCollection: finder foundVariables 
		equals: Set new
]
