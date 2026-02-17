"
A TSDAssignmentFinderTest is a test class for testing the behavior of TSDAssignmentFinder
"
Class {
	#name : 'TSDAssignmentsFinderTest',
	#superclass : 'TSDInstanceVariablesFinderTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'testing' }
TSDAssignmentsFinderTest class >> shouldInheritSelectors [ 

	^ false
]

{ #category : 'accessing' }
TSDAssignmentsFinderTest >> finder [

	^ finder ifNil: [ 
		finder := self finderClass assignments
			selfClass: self fixtureClass; yourself ]
]

{ #category : 'accessing' }
TSDAssignmentsFinderTest >> fixtureClass [

	^ TSDSubFakeTests
]

{ #category : 'tests' }
TSDAssignmentsFinderTest >> testFindAssignmentsFromSubclass [

	self assertMethod: #setUp hasVariables: #( x y subVariableAssigned assignedVariable )
]
