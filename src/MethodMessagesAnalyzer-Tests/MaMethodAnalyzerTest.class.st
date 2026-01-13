"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MaMethodAnalyzerTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaMethodAnalyzerTest >> setUp [
	super setUp.
	analyzer := MaMethodAnalyzer new
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testAnalyzesMethodMessages [

	| originalMethod |
	originalMethod := MaFixture >> #foo .

	analyzer analyzeMethod: originalMethod .
	self 
		assert: (analyzer messages methodMessages: originalMethod) equals: { #x. #y. #z } asSet
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testAreConnected [

	| callsFoo instanceFoo classFoo  |
	callsFoo := MaFixture >> #callsFoo .
	instanceFoo := MaFixture >> #foo .
	classFoo := MaFixture class >> #foo .

	analyzer 
		analyzeMethod: callsFoo ;
		analyzeMethod: instanceFoo ;
		analyzeMethod: classFoo .

	self
		assert: (analyzer messages method: callsFoo isConnectedToMessage: #foo) ;
		assert: (analyzer messages method: callsFoo isConnectedToMessage: #x) ;
		assert: (analyzer messages method: callsFoo isConnectedToMessage: #xxx)
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testCycle [ 

	| rootMethod |
	rootMethod := MaFixtureWithCycles >> #root .
	analyzer
		analyzeMethod: rootMethod;
		analyzeMethod: MaFixtureWithCycles >> #x .

	self 
		assert: (analyzer messages method: rootMethod isConnectedToMessage: #x) ;
		deny: (analyzer messages method: rootMethod isConnectedToMessage: #cycle1) .
		
	analyzer analyzeMethod: MaFixtureWithCycles >> #z .
	
	self assert: (analyzer messages method: rootMethod isConnectedToMessage: #cycle1) 
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testDoesNotIncludeAssert [

	| originalMethod |
	originalMethod := MaFixture >> #fooWithAssert.
	analyzer bannedMessages: { #assert: }.

	analyzer analyzeMethod: originalMethod.
	self deny: (analyzer messages method: originalMethod containsMessage: #assert:) 
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testEmptyAnalyzer [
	
	
	| fooMethod |
	fooMethod := MaFixture >> #foo.
	self
		assertEmpty: analyzer messages methodsAnalyzed;
		should: [ analyzer messages methodMessages: fooMethod ]
		raise: MethodNotFound;
		should: [ analyzer messages method: fooMethod isConnectedToMessage: #bar ] raise: MethodNotFound;
		should: [ analyzer messages method: fooMethod containsMessage: #foo ] raise: MethodNotFound;
		should: [ analyzer messages method: fooMethod containsSubmethod: fooMethod ] raise: MethodNotFound;
		deny: (analyzer messages message: #foo isConnectedTo: #bar )
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testHasTwoFoos [

	| instanceSideMethod classSideMethod |
	instanceSideMethod := MaFixture >> #foo.
	classSideMethod := MaFixture class >> #foo.

	analyzer analyzeMethod: instanceSideMethod.
	analyzer analyzeMethod: classSideMethod.

	self
		assertCollection: (analyzer messages methodMessages: instanceSideMethod) hasSameElements: { #x. #y . #z} ;
		assertCollection: (analyzer messages methodMessages: classSideMethod) hasSameElements: { #xxx. #yyy }
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testInstanceIsMutable [

	| result1 result2 |
	analyzer analyzeMethod: MaFixture >> #foo .
	result1 := analyzer messages .
	analyzer analyzeMethod: MaFixture >> #bar .
	result2 := analyzer messages .
	self 
		deny: result1 equals: result2 ;
		deny: result1 methodsAnalyzed equals: result2 methodsAnalyzed
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testIsTransitive [

	| from to middle |
	from := MaFixture >> #foo .
	middle := MaFixture >> #subContainedFoo .
	to := MaFixture >> #containedFoo .

	analyzer 
		analyzeMethod: from;
		analyzeMethod: middle;
		analyzeMethod: to .
	self 
		assert: (analyzer messages method: from containsSubmethod: middle) ;
		assert: (analyzer messages method: middle containsSubmethod: to) ;
		assert: (analyzer messages method: from containsSubmethod: to)
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testMethodIsIncluded [

	| fooMethod containedFoo |
	fooMethod := MaFixture >> #foo .
	containedFoo := MaFixture >> #containedFoo .
	analyzer analyzeMethod: fooMethod .
	analyzer analyzeMethod: containedFoo.
	self 
		assert: (analyzer messages method: fooMethod containsSubmethod: containedFoo) ;
		deny: (analyzer messages method: containedFoo containsSubmethod: fooMethod) 
]

{ #category : 'tests' }
MaMethodAnalyzerTest >> testSetMessages [

	| messages compiledMethod messagesList |
	messages := MaMessages new.
	compiledMethod := MaFixture >> #foo.
	messagesList := { #these. #messages. #dont. #exist }.
	messages atMethod: compiledMethod putMessages: messagesList.
	self assertCollection: (messages methodMessages: compiledMethod) hasSameElements: messagesList
]
