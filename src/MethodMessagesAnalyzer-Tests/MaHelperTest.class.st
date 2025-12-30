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
	analyzer := MethodMessagesAnalyzer new 	
]

{ #category : 'tests' }
MaHelperTest >> testDetectsHelpers [

	| testHelper helper guardedHelper |
	testHelper := MaHelperFixture >> #testHelper.
	helper := MaHelperFixture >> #helper.
	guardedHelper := MaHelperFixture >> #guardedHelper.
	
	 analyzer analyzeMethod: testHelper.
	
	self 
		assert: (analyzer result isHelper: helper);
		assertCollection: analyzer result helperMethods hasSameElements: { helper };
		assert: (analyzer result helperIsGuarded: guardedHelper );
		assertCollection: analyzer result guardedHelpers hasSameElements: { guardedHelper }
]
