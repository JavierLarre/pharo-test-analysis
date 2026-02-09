Class {
	#name : 'RTDVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'testing' }
RTDVisitorTest class >> isAbstract [ 

	^ self = RTDVisitorTest 
]

{ #category : 'utilities' }
RTDVisitorTest >> analyzeMethodFromFixture: aSelector [
	
	self visitor analyzeMethod: ( self fixtureClass >> aSelector )
]

{ #category : 'accessing' }
RTDVisitorTest >> fixtureClass [

	^ RTDVisitorFixture 
]

{ #category : 'tests' }
RTDVisitorTest >> testEmpty [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
RTDVisitorTest >> visitor [

	^ visitor ifNil: [ visitor := self visitorClass new 
		selfClass: self fixtureClass; yourself ]
]

{ #category : 'accessing' }
RTDVisitorTest >> visitorClass [

	^ self subclassResponsibility 
]
