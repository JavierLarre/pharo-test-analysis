"
I encapsulate the `DTMaTestCaseVisitor`s used as options of analysis
"
Class {
	#name : 'DTRTDWidget',
	#superclass : 'Object',
	#instVars : [
		'testVisitor',
		'viewModel',
		'visitors'
	],
	#category : 'DrTests-RottenTestsDebugger-presenter',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'presenter'
}

{ #category : 'factory' }
DTRTDWidget class >> buildHelperVisitor [

	^ MaHelperVisitor new
		helperSelectors: TAssertable selectors;
		yourself
]

{ #category : 'factory' }
DTRTDWidget class >> buildMethodVisitor [

	^ MaMessageVisitor new
		messages: (MaFilteredMessages new 
			bannedMessages: TAssertable selectors asSet; 
			yourself);
		yourself
]

{ #category : 'api' }
DTRTDWidget >> analyzeTestSuite: aTestSuite [

	visitors do: [ :visitor | 
		visitor visit: aTestSuite; 
		buildViewModel: viewModel ].
	^ viewModel 
]

{ #category : 'initialization' }
DTRTDWidget >> initialize [ 

	super initialize.
	viewModel := DTRTDViewModel new.
	visitors := { DTRTDHelperVisitor . DTRTDMessageVisitor . DTRTDSelfMethodsVisitor } collect: [ :visitorClass |
		visitorClass new ] 
]
