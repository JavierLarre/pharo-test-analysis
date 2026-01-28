"
A RTDTestLatticeTest is a test class for testing the behavior of RTDTestLattice
"
Class {
	#name : 'RTDLatticeTest',
	#superclass : 'TestCase',
	#instVars : [
		'lattice'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'tests' }
RTDLatticeTest >> testNoMessages [

	lattice := RTDLatticeBuilder new.
	
	self should: [ lattice messages ] raise: Error
]
