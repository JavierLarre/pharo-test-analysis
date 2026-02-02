Class {
	#name : 'TSDFixtureTest',
	#superclass : 'TestCase',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'as yet unclassified' }
TSDFixtureTest >> fixtureClass [
	
	^ TSDFixture 
]

{ #category : 'running' }
TSDFixtureTest >> setUp [
	super setUp.
	TSDSuperclassFixture superclass: TestCase.
]

{ #category : 'running' }
TSDFixtureTest >> tearDown [ 

	TSDSuperclassFixture superclass: Object.
	super tearDown
]
