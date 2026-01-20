Class {
	#name : 'DTMaMessageVisitor',
	#superclass : 'DTMaTestCaseVisitor',
	#instVars : [
		'testCasesMessages'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-visitor',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'visitor'
}

{ #category : 'build' }
DTMaMessageVisitor >> buildViewModel: aViewModel [

	aViewModel testCasesMessages: testCasesMessages 
]

{ #category : 'private' }
DTMaMessageVisitor >> doesMethodHasLessMessages: aTestCase than: aBiggerTest [

	| messages |
	messages := methodVisitor messages.

	^ (messages methodMessages: aTestCase testMethod) size < (messages methodMessages: aBiggerTest testMethod ) size
]

{ #category : 'initialization' }
DTMaMessageVisitor >> initialize [ 

	super initialize.
	methodVisitor := MaMessageVisitor new
		messages: (MaFilteredMessages new 
			bannedMessages: TAssertable selectors asSet; 
			yourself);
		yourself.
	testCasesMessages := SortedCollection new 
		sort: [ :testCaseMessages1 :testCaseMessages2 | 
			(methodVisitor messages 
				method: testCaseMessages1 testMethod 
				containsSubmethod: testCaseMessages2 testMethod) or: [ 
					self doesMethodHasLessMessages: testCaseMessages1 than: testCaseMessages2 ] ];
			yourself.
]

{ #category : 'accessing' }
DTMaMessageVisitor >> testCasesMessages [

	^ testCasesMessages
]

{ #category : 'visiting' }
DTMaMessageVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.

	super visitTestCase: aTestCase.
	testCasesMessages add: (DTMaTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: (methodVisitor messages methodMessages: compiledMethod) asOrderedCollection ;
			 yourself).
]
