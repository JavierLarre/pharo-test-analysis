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

{ #category : 'asserting' }
TSDInstanceVariablesFinderTest >> assertMethod: aSelector hasVariables: aCollection [

	self 
		assertCollection: (self finder at: aSelector ) 
		equals: aCollection asSet
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
	
	^ TSDFakeTests 
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testDefaultFinder [
	
	self assertMethod: #x hasVariables: #( x )
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testEmptyFinder [
	
	self 
		assertFoundVariables: #()
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testIgnoresLocalVariables [

	self assertMethod: #testUsesLocalVariables hasVariables: #()
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testUseTwice [
	
	self finder visitSelector: #x.
	self assertFoundVariables: #( x ).
	self finder visitSelector: #assignVariable.
	self assertFoundVariables: #( x assignedVariable )
]

{ #category : 'tests' }
TSDInstanceVariablesFinderTest >> testVisitsAreCached [

	self 
		assertMethod: #x hasVariables: { #x };
		assertEmpty: (self finder at: #testUsesLocalVariables );
		assertMethod: #x hasVariables: { #x };
		assertFoundVariables: { }
]
