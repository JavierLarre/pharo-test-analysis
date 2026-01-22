"
I provide a method for building a `DTRTDTestCaseMessages` with the messages of `MaMessageVisitor`
"
Class {
	#name : 'DTRTDFingerPrintVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'testCasesMessages'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'building' }
DTRTDFingerPrintVisitor >> buildTestCaseMessages: aTestCase [

	^ (super buildTestCaseMessages: aTestCase)
		  messages: (methodVisitor messages at: (self testCaseMethod: aTestCase) ) asOrderedCollection ;
		  yourself
]

{ #category : 'comparing' }
DTRTDFingerPrintVisitor >> compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 [

	(methodVisitor messages 
		does: testCaseMessages1 testMethod 
		includesSubMethod: testCaseMessages2 testMethod)
			ifTrue: [ ^ false ].
	(methodVisitor messages 
		does: testCaseMessages2 testMethod 
		includesSubMethod: testCaseMessages1 testMethod)
			ifTrue: [ ^ true ].
	^ testCaseMessages1 <= testCaseMessages2 
	
]

{ #category : 'initialization' }
DTRTDFingerPrintVisitor >> initialize [

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
