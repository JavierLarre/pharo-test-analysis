Class {
	#name : 'DTRTDFingerPrintVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'testCasesMessages'
	],
	#category : 'DrTests-RottenTestsDebugger',
	#package : 'DrTests-RottenTestsDebugger'
}

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
