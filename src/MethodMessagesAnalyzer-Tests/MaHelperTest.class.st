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
					considerClassesThat: [:class | class inheritsFrom: TestCase]; 
				yourself));
		yourself.
	MaHelperFixture superclass: TestCase
]

{ #category : 'running' }
MaHelperTest >> tearDown [ 
	MaHelperFixture superclass: Object.
	super tearDown 
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
