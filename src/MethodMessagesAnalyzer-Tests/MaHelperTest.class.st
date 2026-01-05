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
					considerClassesThat: [:class | true]; 
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
MaHelperTest >> testDetectsHelpers [

	| testHelper helper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	helper := MaHelperFixture >> #helper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	 analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: helper);
		assertCollection: (analyzer helpers helpersOf: testHelper) hasSameElements: { helper . guardedHelper };
		assert: (analyzer helpers helperIsGuarded: guardedHelper );
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
		assert: (analyzer helpers helperIsGuarded: guardedHelper);
		deny: (analyzer helpers helperIsGuarded: notAHelper)
]

{ #category : 'tests' }
MaHelperTest >> testGuardedHelperIsHelper [

	| testHelper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer helpers atMethod: testHelper includesHelper: guardedHelper );
		assert: (analyzer helpers helperIsGuarded: guardedHelper );
		assertCollection: analyzer helpers guardedHelpers hasSameElements: { guardedHelper }
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
