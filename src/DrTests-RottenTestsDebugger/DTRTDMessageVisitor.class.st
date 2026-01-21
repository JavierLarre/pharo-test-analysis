"
I analyze test cases using `MaMessageVisitor` and build the view model with the messages found
"
Class {
	#name : 'DTRTDMessageVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'testCasesMessages'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'build' }
DTRTDMessageVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesMessages: testCasesMessages 
]

{ #category : 'as yet unclassified' }
DTRTDMessageVisitor >> compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 [

	(methodVisitor messages 
		method: testCaseMessages1 testMethod 
		includesSubmethod: testCaseMessages2 testMethod)
			ifTrue: [ ^ false ].
	(methodVisitor messages 
		method: testCaseMessages2 testMethod 
		includesSubmethod: testCaseMessages1 testMethod)
			ifTrue: [ ^ true ].
	^ testCaseMessages1 <= testCaseMessages2 
	
]

{ #category : 'initialization' }
DTRTDMessageVisitor >> initialize [

	super initialize.
	methodVisitor := MaMessageVisitor new
		                 messages: (MaFilteredMessages new
				                  bannedMessages: TAssertable selectors asSet;
				                  yourself);
		                 yourself.
	testCasesMessages := SortedCollection new
		                     sort: [ :testCaseMessages1 :testCaseMessages2 |
			                     self compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 ];
		                     yourself
]

{ #category : 'visiting' }
DTRTDMessageVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.

	super visitTestCase: aTestCase.
	testCasesMessages add: (DTRTDTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: (methodVisitor messages atMethod: compiledMethod) asOrderedCollection ;
			 yourself).
]
