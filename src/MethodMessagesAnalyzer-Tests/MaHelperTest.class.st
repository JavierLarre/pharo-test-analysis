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
	analyzer := MaMethodAnalyzer new 
		selfCallsFinder: 
			(MaInterpreterWrapper new 
				interpreter: (RTFSelfCallInterpreter new 
					considerClassesThat: [:class | class inheritsFrom: TestCase ]; 
				yourself));
		yourself.
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
		assert: (analyzer helpers isGuarded: guardedHelper );
		assertCollection: analyzer helpers guardedHelpers hasSameElements: { guardedHelper }
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
		assert: (analyzer helpers isGuarded: guardedHelper);
		deny: (analyzer helpers isGuarded: notAHelper)
]

{ #category : 'tests' }
MaHelperTest >> testEmpty [

	self assertEmpty: analyzer helpers helpers;
		assertEmpty: analyzer helpers guardedHelpers;
		should: [ analyzer helpers helpersOf: MaHelperFixture >> #testHelper ] raise: MethodNotFound;
		should: [ analyzer helpers atMethod: MaHelperFixture >> #testHelper includesHelper: MaHelperFixture >> #helper] raise: MethodNotFound; 
		deny: (analyzer helpers isGuarded: MaHelperFixture >> #guardedHelper)
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
		deny: (analyzer helpers isGuarded: MaHelperFixture >> #guardedHelper )
]

{ #category : 'tests' }
MaHelperTest >> testFindsAllGuardedMessages [

	| testBigHelperGuarded bigHelper |
	testBigHelperGuarded := MaHelperFixture >> #testBigHelperGuarded .
	bigHelper := MaHelperFixture >> #bigHelper.
	
	analyzer analyzeMethod: testBigHelperGuarded.
	
	self 
		assert: (analyzer helpers isGuarded: bigHelper );
		assert: (analyzer messages method: bigHelper isConnectedToMessage: #helper0);
		deny: (analyzer helpers isGuarded: MaHelperFixture >> #helper0)
]

{ #category : 'tests' }
MaHelperTest >> testGuardedHelperIsHelper [

	| testHelper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: guardedHelper );
		assert: (analyzer helpers isGuarded: guardedHelper );
		assertCollection: analyzer helpers guardedHelpers hasSameElements: { guardedHelper }
]

{ #category : 'tests' }
MaHelperTest >> testHelpersMayBeAdded [

	| helper isHelperGuardedBlock |
	helper := MaHelperFixture >> #bigHelper.
	isHelperGuardedBlock := [ analyzer helpers isGuarded: helper ].
	
	analyzer analyzeMethod: MaHelperFixture >> #testBigHelper.
	
	self deny: isHelperGuardedBlock value.
		
	analyzer analyzeMethod: MaHelperFixture >> #testBigHelperGuarded .
	
	self assert: isHelperGuardedBlock value
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
