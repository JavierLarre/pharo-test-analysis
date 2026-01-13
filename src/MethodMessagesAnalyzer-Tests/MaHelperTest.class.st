Class {
	#name : 'MaHelperTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaHelperTest >> setUp [
	
	super setUp.
	analyzer := MaMethodAnalyzer new.
	MaHelperFixture superclass: TestCase 
]

{ #category : 'running' }
MaHelperTest >> tearDown [ 
	super tearDown.
	MaHelperFixture superclass: Object 
]

{ #category : 'tests' }
MaHelperTest >> testAssertIsNotHelper [

	| helper |
	helper := MaHelperFixture >> #helper.
	
	 analyzer analyzeMethod: helper.
	
	self 
		deny: (analyzer helpers atMethod: helper includesHelper: (MaHelperFixture lookupSelector: #assert:))
]

{ #category : 'tests' }
MaHelperTest >> testDetectsHelpers [

	| testHelper helper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	helper := MaHelperFixture >> #helper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	 analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: helper);
		assertCollection: (analyzer helpers helpersOf: testHelper) hasSameElements: { helper . guardedHelper };
		assertCollection: (analyzer guardedHelpers helpersOf: testHelper ) hasSameElements: { guardedHelper }
]

{ #category : 'tests' }
MaHelperTest >> testDistinguishesGuardedHelpers [

	| testHelper helper guardedHelper notAHelper |
	testHelper := MaHelperFixture >> #testNotHelperIsGuarded.
	notAHelper := MaHelperFixture >> #notAHelper.
	helper := MaHelperFixture >> #helper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	 analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: guardedHelper);
		assert: (analyzer guardedHelpers atMethod: testHelper includesHelper: guardedHelper);
		deny: (analyzer guardedHelpers atMethod: testHelper includesHelper: notAHelper)
]

{ #category : 'tests' }
MaHelperTest >> testEmpty [

	self assertEmpty: analyzer helpers helpers;
		assertEmpty: analyzer guardedHelpers helpers;
		should: [ analyzer helpers helpersOf: MaHelperFixture >> #testHelper ] raise: MethodNotFound;
		should: [ analyzer helpers atMethod: MaHelperFixture >> #testHelper includesHelper: MaHelperFixture >> #helper] raise: MethodNotFound;
		should: [ analyzer guardedHelpers atMethod: MaHelperFixture >> #testHelper includesHelper: MaHelperFixture >> #helper] raise: MethodNotFound
]

{ #category : 'tests' }
MaHelperTest >> testFalseGuarded [

	| testHelper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	guardedHelper := MaHelperFixture class >> #guardedHelper.
	
	analyzer 
		analyzeMethod: testHelper;
		analyzeMethod: MaHelperFixture class >> #testFalseGuarded.
	
	self 
		assert: (analyzer guardedHelpers atMethod: testHelper includesHelper: MaHelperFixture >> #guardedHelper )
]

{ #category : 'tests' }
MaHelperTest >> testFindsAllGuardedMessages [

	| testBigHelperGuarded bigHelper |
	testBigHelperGuarded := MaHelperFixture >> #testBigHelperGuarded .
	bigHelper := MaHelperFixture >> #bigHelper.
	
	analyzer analyzeMethod: testBigHelperGuarded.
	
	self 
		assert: (analyzer guardedHelpers atMethod: testBigHelperGuarded includesHelper: bigHelper );
		assert: (analyzer messages method: bigHelper isConnectedToMessage: #helper0);
		deny: (analyzer guardedHelpers atMethod: testBigHelperGuarded includesHelper: MaHelperFixture >> #helper0)
]

{ #category : 'tests' }
MaHelperTest >> testGuardedHelperIsHelper [

	| testHelper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: guardedHelper );
		assert: (analyzer guardedHelpers atMethod: testHelper includesHelper: guardedHelper );
		assertCollection: (analyzer guardedHelpers helpersOf: testHelper ) hasSameElements: { guardedHelper }
]

{ #category : 'tests' }
MaHelperTest >> testIgnoresNotHelper [

	| testHelper |
	testHelper := MaHelperFixture >> #testHelper.
	
	 analyzer analyzeMethod: testHelper.
	
	self 
		deny: (analyzer helpers atMethod: testHelper includesHelper: MaHelperFixture >> #notAHelper )
]

{ #category : 'tests' }
MaHelperTest >> testIncludesHelper [

	| testHelper helper |
	testHelper := MaHelperFixture >> #testHelper.
	helper := MaHelperFixture >> #helper.
	
	 analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: helper)
]

{ #category : 'tests' }
MaHelperTest >> testSetHelpers [

	| helpers compiledHelper expectedHelpers |
	helpers := MaHelpers new.
	compiledHelper := MaHelperFixture >> #helper.
	expectedHelpers := { #these. #helpers. #dont. #exist }.
	helpers
		atMethod: compiledHelper putHelpers: expectedHelpers.
	self
		assertCollection: (helpers helpersOf: compiledHelper ) hasSameElements: expectedHelpers;
		assert: (helpers atMethod: compiledHelper includesHelper: #helpers)
]
