Class {
	#name : 'TSDInstanceVariablesFinderTest',
	#superclass : 'TestCase',
	#instVars : [
		'finder'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> assertFoundVariables: aCollection [

	self assertCollection: finder foundVariables equals: aCollection asSet 
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> finder [
	
	^ TSDInstanceVariablesFinder new
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> finderClass [
	^ TSDInstanceVariablesFinder 
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> fixtureClass [
	
	^ TSDFixture 
]

{ #category : 'running' }
TSDInstanceVariablesFinderTest >> setUp [
	
	super setUp.
	finder := self finder
		selfClass: self fixtureClass;
		yourself
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testEmptyFinder [

	finder := TSDInstanceVariablesFinder selfClass: self fixtureClass.
	
	self 
		visit: #x;
		assertFoundVariables: #( x )
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> visit: aSelector [

	finder
		visit: (self fixtureClass >> aSelector ) parseTree. 
]
