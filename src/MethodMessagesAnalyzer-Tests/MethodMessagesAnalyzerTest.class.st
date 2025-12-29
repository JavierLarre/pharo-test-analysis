"
A MyTestAnalyzerTest is a test class for testing the behavior of MyTestAnalyzer
"
Class {
	#name : 'MethodMessagesAnalyzerTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MethodMessagesAnalyzerTest >> setUp [
	super setUp.
	analyzer := MethodMessagesAnalyzer new
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testAnalyzesMethodMessages [

	| originalMethod |
	originalMethod := MethodMessagesAnalyzerFixture >> #foo .

	analyzer analyzeMethod: originalMethod .
	self 
		assert: (analyzer result methodMessages: originalMethod) equals: { #x. #y. #z } asSet
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testAreConnected [

	| callsFoo instanceFoo classFoo  |
	callsFoo := MethodMessagesAnalyzerFixture >> #callsFoo .
	instanceFoo := MethodMessagesAnalyzerFixture >> #foo .
	classFoo := MethodMessagesAnalyzerFixture class >> #foo .

	analyzer 
		analyzeMethod: callsFoo ;
		analyzeMethod: instanceFoo ;
		analyzeMethod: classFoo .

	self
		assert: (analyzer result method: callsFoo isConnectedToMessage: #foo) ;
		assert: (analyzer result method: callsFoo isConnectedToMessage: #x) ;
		assert: (analyzer result method: callsFoo isConnectedToMessage: #xxx)
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testCycle [

	| cycleMethod |
	cycleMethod := MaAcceptanceFixture >> #cycle1.
	analyzer
		analyzeMethod: cycleMethod;
		analyzeMethod: MaAcceptanceFixture >> #cycle2.
	self 
		deny: (analyzer result method: cycleMethod isConnectedToMessage: #doesNotExist)
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testDoesNotIncludeAssert [

	| originalMethod |
	originalMethod := MethodMessagesAnalyzerFixture >> #fooWithAssert.

	analyzer analyzeMethod: originalMethod.
	self deny: (analyzer result method: originalMethod containsMessage: #assert:) 
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testEmptyAnalyzer [

	self 
		assertEmpty: (analyzer result methodsAnalyzed) ;
		should: [ analyzer result methodMessages: (MethodMessagesAnalyzerFixture >> #foo) ] raise: MethodNotFound
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testHasTwoFoos [

	| instanceSideMethod classSideMethod |
	instanceSideMethod := MethodMessagesAnalyzerFixture >> #foo.
	classSideMethod := MethodMessagesAnalyzerFixture class >> #foo.

	analyzer analyzeMethod: instanceSideMethod.
	analyzer analyzeMethod: classSideMethod.

	self
		assertCollection: (analyzer result methodMessages: instanceSideMethod) hasSameElements: { #x. #y . #z} ;
		assertCollection: (analyzer result methodMessages: classSideMethod) hasSameElements: { #xxx. #yyy }
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testInstanceIsMutable [

	| result1 result2 |
	analyzer analyzeMethod: MethodMessagesAnalyzerFixture >> #foo .
	result1 := analyzer result .
	analyzer analyzeMethod: MethodMessagesAnalyzerFixture >> #bar .
	result2 := analyzer result .
	self 
		deny: result1 equals: result2 ;
		deny: result1 methodsAnalyzed equals: result2 methodsAnalyzed
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testIsTransitive [

	| from to middle |
	from := MethodMessagesAnalyzerFixture >> #foo .
	middle := MethodMessagesAnalyzerFixture >> #subContainedFoo .
	to := MethodMessagesAnalyzerFixture >> #containedFoo .

	analyzer 
		analyzeMethod: from;
		analyzeMethod: middle;
		analyzeMethod: to .
	self 
		assert: (analyzer result method: from containsSubmethod: middle) ;
		assert: (analyzer result method: middle containsSubmethod: to) ;
		assert: (analyzer result method: from containsSubmethod: to)
]

{ #category : 'tests' }
MethodMessagesAnalyzerTest >> testMethodIsIncluded [

	| fooMethod containedFoo |
	fooMethod := MethodMessagesAnalyzerFixture >> #foo .
	containedFoo := MethodMessagesAnalyzerFixture >> #containedFoo .
	analyzer analyzeMethod: fooMethod .
	analyzer analyzeMethod: containedFoo.
	self 
		assert: (analyzer result method: fooMethod containsSubmethod: containedFoo) ;
		deny: (analyzer result method: containedFoo containsSubmethod: fooMethod) 
]
