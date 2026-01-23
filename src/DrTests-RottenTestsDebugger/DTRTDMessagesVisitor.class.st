"
I provide a method for building a `DTRTDTestCaseMessages` with the messages of `MaMessageVisitor`
"
Class {
	#name : 'DTRTDMessagesVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'factory' }
DTRTDMessagesVisitor class >> methodVisitorClass [

	^ RTDMessageVisitor
]

{ #category : 'building' }
DTRTDMessagesVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	super buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase.
	aTestCaseViewModel 
		messages: (methodVisitor messages at: (self testCaseMethod: aTestCase) ) asOrderedCollection
]

{ #category : 'building' }
DTRTDMessagesVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesMessages: testCasesViewModels 
]

{ #category : 'comparing' }
DTRTDMessagesVisitor >> compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 [

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
DTRTDMessagesVisitor >> initialize [

	super initialize.
	methodVisitor messages: (MaFilteredMessages new 
		bannedMessages: TAssertable selectors asSet;
		yourself).
	testCasesViewModels := SortedCollection new
		                     sort: [ :testCaseMessages1 :testCaseMessages2 |
			                     self compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 ];
		                     yourself
]
