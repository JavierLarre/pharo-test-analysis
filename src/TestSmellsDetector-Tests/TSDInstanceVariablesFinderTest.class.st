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

	self assertCollection: self finder foundVariables equals: aCollection asSet 
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> finder [
	
	^ finder ifNil: [ 
		finder := self finderClass new
			selfClass: self fixtureClass; yourself ]
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> finderClass [
	^ TSDInstanceVariablesFinder 
]

{ #category : 'accessing' }
TSDInstanceVariablesFinderTest >> fixtureClass [
	
	^ TSDFixture 
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

	self finder
		visit: (self fixtureClass >> aSelector ) parseTree. 
]
