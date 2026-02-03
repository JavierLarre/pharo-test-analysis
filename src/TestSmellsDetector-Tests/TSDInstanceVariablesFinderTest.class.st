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
	
	^ self finderClass new
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
TSDInstanceVariablesFinderTest >> testDefaultFinder [
	
	self 
		visit: #x;
		assertFoundVariables: #( x )
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testEmptyFinder [
	
	self 
		assertFoundVariables: #()
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testIgnoresLocalVariables [

	self
		visit: #testUsesLocalVariables;
		assertFoundVariables: #()
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testUseTwice [
	
	self 
		visit: #x;
		assertFoundVariables: #( x );
		visit: #assignVariable;
		assertFoundVariables: #( x assignedVariable )
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> visit: aSelector [

	finder
		visit: (self fixtureClass >> aSelector ) parseTree. 
]
