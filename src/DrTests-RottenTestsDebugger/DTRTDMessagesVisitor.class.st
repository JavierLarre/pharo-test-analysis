"
I provide a method for building a `DTRTDTestCaseMessages` with the messages of `MaMessageVisitor`
"
Class {
	#name : 'DTRTDMessagesVisitor',
	#superclass : 'DTRTDTestCaseAnalyzer',
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDMessagesVisitor >> buildMethodViewModel: aTestCaseViewModel withTestCase: aTestCase [

	super buildMethodViewModel: aTestCaseViewModel withTestCase: aTestCase.
	aTestCaseViewModel 
		messages: (self methodVisitor messages at: aTestCase compiledMethod )
]

{ #category : 'building' }
DTRTDMessagesVisitor >> buildViewModel: aViewModel [

	aViewModel messages: self methodViewModels
]

{ #category : 'comparing' }
DTRTDMessagesVisitor >> compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 [

	(self methodVisitor messages 
		does: testCaseMessages1 compiledMethod 
		includesSubMethod: testCaseMessages2 compiledMethod)
			ifTrue: [ ^ false ].
	(self methodVisitor messages 
		does: testCaseMessages2 compiledMethod 
		includesSubMethod: testCaseMessages1 compiledMethod)
			ifTrue: [ ^ true ].
	^ testCaseMessages1 <= testCaseMessages2 
	
]

{ #category : 'initialization' }
DTRTDMessagesVisitor >> initialize [

	super initialize.
	self methodVisitor messages: RTDFilteredMessages withAssertableSelectors.
	self methodVisitor messages bannedMessages add: #new.
	self methodViewModels: (SortedCollection new
		sort: [ :testCaseMessages1 :testCaseMessages2 |
			self compareTestCaseMessages: testCaseMessages1 with: testCaseMessages2 ];
		yourself)
]

{ #category : 'factory' }
DTRTDMessagesVisitor >> methodVisitorClass [

	^ RTDMessageVisitor
]
