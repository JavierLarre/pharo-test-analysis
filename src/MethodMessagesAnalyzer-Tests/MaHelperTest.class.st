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
	analyzer := MethodMessagesAnalyzer new.
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
		assert: (analyzer result isHelper: helper in: testHelper);
		assertCollection: (analyzer result helperMethodsOf: testHelper) hasSameElements: { helper . guardedHelper };
		assert: (analyzer result helperIsGuarded: guardedHelper );
		assertCollection: analyzer result guardedHelpers hasSameElements: { guardedHelper }
]
