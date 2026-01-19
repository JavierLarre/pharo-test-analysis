Class {
	#name : 'DTMaWidget',
	#superclass : 'Object',
	#instVars : [
		'testVisitor'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'factory' }
DTMaWidget class >> buildMethodVisitor [

	^ MaMessageVisitor new
		messages: (MaFilteredMessages new 
			bannedMessages: TAssertable selectors asSet; 
			yourself);
		yourself
]

{ #category : 'api' }
DTMaWidget >> analyzeTestSuite: aTestSuite [

	testVisitor visit: aTestSuite. 
	^ DTMaViewModel new
		  testCasesMessages: testVisitor testCasesMessages;
		  yourself
]

{ #category : 'initialization' }
DTMaWidget >> initialize [ 

	super initialize.
	testVisitor := DTMaTestCaseVisitor new 
		methodVisitor: self class buildMethodVisitor;
		yourself
]
