Class {
	#name : 'TSDInstanceVariablesFinderTest',
	#superclass : 'TestCase',
	#instVars : [
		'finder'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> finderClass [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> fixtureClass [
	
	^ TSDFixture 
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
