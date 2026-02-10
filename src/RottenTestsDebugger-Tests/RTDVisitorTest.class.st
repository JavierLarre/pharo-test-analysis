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

{ #category : 'asserting' }
RTDVisitorTest >> assertAt: aSelector hasMethods: aCollection [

	^ self 
		assertCollection: (self methodsAt: aSelector)
		hasSameElements: (self fixtureMethodsFrom: aCollection )
]

{ #category : 'accessing' }
RTDVisitorTest >> fixtureClass [

	^ RTDVisitorFixture 
]

{ #category : 'accessing' }
RTDVisitorTest >> fixtureMethodsFrom: aCollection [

	^ aCollection collect: [ :aSelector | self fixtureClass >> aSelector ]
]

{ #category : 'accessing' }
RTDVisitorTest >> methodsAt: aSelector [

	^ self visitorMethods at: self fixtureClass >> aSelector
]

{ #category : 'tests' }
RTDVisitorTest >> testEmpty [
	
	^ self assertEmpty: self visitorMethods
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

{ #category : 'accessing' }
RTDVisitorTest >> visitorMethods [

	^ self subclassResponsibility 
]
