Class {
	#name : 'MaSelfCallsInterpreterTest',
	#superclass : 'TestCase',
	#instVars : [
		'selfCallFinder'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'as yet unclassified' }
MaSelfCallsInterpreterTest >> helperMethodFromFixture: aSelector [
	
	^MaHelperFixture >> aSelector 
]

{ #category : 'running' }
MaSelfCallsInterpreterTest >> setUp [
	super setUp.
	selfCallFinder := MySelfCallsInterpreter new.
	MaHelperFixture superclass: TestCase 
]

{ #category : 'running' }
MaSelfCallsInterpreterTest >> tearDown [ 
	MaHelperFixture superclass: Object.
	super tearDown 
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testAnalyzerIsEmpty [
	
	self 
		assertEmpty: selfCallFinder guardedMessages;
		assertEmpty: selfCallFinder methodsSelfCalls;
		assertEmpty: selfCallFinder messages methodsAnalyzed;
		assertEmpty: selfCallFinder helpers helpers 
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testDifferentiatesNestedGuardedMessages [
	
	selfCallFinder analyzeMethod: (self helperMethodFromFixture: #testBigHelper).
	
	self 
		assert: (selfCallFinder guardedMessages includes: #guardedHelper ); 
		deny: (selfCallFinder guardedMessages includes: #bigHelper )
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testFindsSelfCalls [
	
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	
	self assert: (selfCallFinder selfSentMethods includes: MaHelperFixture >> #helper)
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testHasMethodSelfCalls [
	
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	
	self 
		assertCollection: (selfCallFinder methodsSelfCalls at: MaHelperFixture >> #testHelper) 
		hasSameElements: { MaHelperFixture >> #helper . 
			MaHelperFixture >> #guardedHelper . 
			MaHelperFixture >> #notAHelper }
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testIncludesCallOnArguments [ 
	
	selfCallFinder analyzeMethod: MaHelperFixture >> #testHelperOnArguments.
	
	self 
		assertCollection: selfCallFinder selfSentMethods 
		includesAll: { MaHelperFixture >> #helper } 
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testIncludesGuardedMessages [
	
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	
	self 
		assertCollection: selfCallFinder guardedMessages 
		hasSameElements: { #guardedHelper }
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testIncludesHelper [ 
	
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	
	self 
		assertCollection: (selfCallFinder helpers helpersOf: MaHelperFixture >> #testHelper ) 
		hasSameElements: { MaHelperFixture >> #helper . MaHelperFixture >> #guardedHelper } 
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testIncludesHelperFromOtherSelfCalls [
	
	selfCallFinder send: #testNested fromClass: MaHelperFixture.
	
	self 
		assertCollection: (selfCallFinder helpers helpersOf: MaHelperFixture >> #nestedHelper ) 
		hasSameElements: { MaHelperFixture >> #helper } 
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testIncludesMessages [
	
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	
	self 
		assertCollection: (selfCallFinder messages methodMessages: MaHelperFixture >> #testHelper)
		includesAll: { #helper . #foo . #ifTrue: . #notAHelper }
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testIncludesNestedGuardedMessages [
	
	selfCallFinder analyzeMethod: (self helperMethodFromFixture: #testBigHelperGuarded).
	
	self 
		assertCollection: selfCallFinder guardedMessages 
		includesAll: { #bigHelper . #guardedHelper }.
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testVisitsAreEqual [
	
	| newSelfCallFinder |
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	newSelfCallFinder := MySelfCallsInterpreter new 
		send: #testHelper fromClass: MaHelperFixture; 
		yourself.
	
	self 
		assert: (selfCallFinder messages) 
		equals: (newSelfCallFinder messages)
]

{ #category : 'tests' }
MaSelfCallsInterpreterTest >> testVisitsSelfCalls [
	
	selfCallFinder send: #testHelper fromClass: MaHelperFixture.
	
	self 
		assert: (selfCallFinder messages includes: MaHelperFixture >> #helper)
]
