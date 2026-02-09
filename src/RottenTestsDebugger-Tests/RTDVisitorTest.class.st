Class {
	#name : 'RTDVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'utilities' }
RTDVisitorTest >> analyzeMethodFromFixture: aSelector [
	
	self visitor analyzeMethod: ( self fixtureClass >> aSelector )
]

{ #category : 'accessing' }
RTDVisitorTest >> fixtureClass [

	^ RTDVisitorFixture 
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
