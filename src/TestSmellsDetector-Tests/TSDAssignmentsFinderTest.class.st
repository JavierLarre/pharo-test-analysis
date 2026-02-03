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

{ #category : 'accessing' }
TSDAssignmentsFinderTest >> fixtureClass [

	^ TSDSubFixture
]

{ #category : 'tests' }
TSDAssignmentsFinderTest >> testFindAssignmentsFromSubclass [

	self 
		visit: #setUp;
		assertFoundVariables: #( x y subVariableAssigned assignedVariable )
]
