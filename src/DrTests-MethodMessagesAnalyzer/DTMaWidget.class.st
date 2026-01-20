Class {
	#name : 'DTMaWidget',
	#superclass : 'Object',
	#instVars : [
		'testVisitor',
		'viewModel',
		'visitors'
	],
	#category : 'DrTests-MethodMessagesAnalyzer-presenter',
	#package : 'DrTests-MethodMessagesAnalyzer',
	#tag : 'presenter'
}

{ #category : 'factory' }
DTMaWidget class >> buildHelperVisitor [

	^ MaHelperVisitor new
		helperSelectors: TAssertable selectors;
		yourself
]

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

	visitors do: [ :visitor | 
		visitor visit: aTestSuite; 
		buildViewModel: viewModel ].
	^ viewModel 
]

{ #category : 'initialization' }
DTMaWidget >> initialize [ 

	super initialize.
	viewModel := DTMaViewModel new.
	visitors := { DTMaHelperVisitor . DTMaMessageVisitor } collect: [ :visitorClass |
		visitorClass new ] 
]
