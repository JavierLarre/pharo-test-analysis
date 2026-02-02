Class {
	#name : 'TSDInstanceVariablesFinderTest',
	#superclass : 'TSDFixtureTest',
	#instVars : [
		'finder'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'as yet unclassified' }
TSDInstanceVariablesFinderTest >> finderClass [
	^ self subclassResponsibility
]

{ #category : 'running' }
TSDInstanceVariablesFinderTest >> setUp [
	
	super setUp.
	finder := self finderClass new
		selfClass: self fixtureClass;
		yourself
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> visit: aSelector [

	finder
		visit: (self fixtureClass >> aSelector ) parseTree. 
]
