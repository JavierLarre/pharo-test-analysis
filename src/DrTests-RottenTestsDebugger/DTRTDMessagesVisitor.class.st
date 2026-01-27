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

{ #category : 'building' }
DTRTDMessagesVisitor >> buildMethodViewModel: aTestCaseViewModel withTestCase: aTestCase [

	super buildMethodViewModel: aTestCaseViewModel withTestCase: aTestCase.
	aTestCaseViewModel 
		messages: (methodVisitor messages at: (self testCaseMethod: aTestCase) )
]

{ #category : 'building' }
DTRTDMessagesVisitor >> buildViewModel: aViewModel [

	aViewModel messages: methodViewModels 
]

{ #category : 'comparing' }
DTRTDMessagesVisitor >> compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 [

	(methodVisitor messages 
		does: testCaseMessages1 compiledMethod 
		includesSubMethod: testCaseMessages2 compiledMethod)
			ifTrue: [ ^ false ].
	(methodVisitor messages 
		does: testCaseMessages2 compiledMethod 
		includesSubMethod: testCaseMessages1 compiledMethod)
			ifTrue: [ ^ true ].
	^ testCaseMessages1 <= testCaseMessages2 
	
]

{ #category : 'initialization' }
DTRTDMessagesVisitor >> initialize [

	super initialize.
	methodVisitor 
		messages: (MaFilteredMessages new 
			bannedMessages: (TAssertable selectors union: { #new } ) asSet;
			yourself).
	methodViewModels := SortedCollection new
		sort: [ :testCaseMessages1 :testCaseMessages2 |
			self compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 ];
		yourself
]

{ #category : 'factory' }
DTRTDMessagesVisitor >> methodVisitorClass [

	^ RTDMessageVisitor
]
