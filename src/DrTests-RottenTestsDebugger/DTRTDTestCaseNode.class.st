"
I am a DrTestTreeLeaf for displaying the messages of a test case
"
Class {
	#name : 'DTRTDTestCaseNode',
	#superclass : 'DTAbstractTreeNode',
	#instVars : [
		'name',
		'subResults',
		'testCaseMessages'
	],
	#category : 'DrTests-RottenTestsDebugger-node',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'node'
}

{ #category : 'factory' }
DTRTDTestCaseNode class >> buildNodeByClass: testCasesMessages [

	^ self buildTreeNode
		subResults: (self buildNodesByClass: testCasesMessages );
		yourself
]

{ #category : 'factory' }
DTRTDTestCaseNode class >> buildNodeWithMessages: testCasesMessages [

	^ self buildTreeNode 
		subResults: (testCasesMessages collect: [ :testCaseMessages | 
			self messages: testCaseMessages ] );
		yourself 
]

{ #category : 'factory' }
DTRTDTestCaseNode class >> buildNodesByClass: testCasesMessages [

	^ (self groupTestCasesByClass: testCasesMessages ) associations collect: [ :assoc | 
		(self buildNodeWithMessages: assoc value )
			name: assoc key name;
			yourself ]
]

{ #category : 'factory' }
DTRTDTestCaseNode class >> buildTreeNode [

	^ DTTreeNode new
]

{ #category : 'utilities' }
DTRTDTestCaseNode class >> groupTestCasesByClass: testCasesMessages [

	^ testCasesMessages groupedBy: [ :testCaseMessages | testCaseMessages testCase class ]
]

{ #category : 'instance creation' }
DTRTDTestCaseNode class >> messages: aTestCaseMessages [

	^ self new
		messages: aTestCaseMessages;
		yourself
]

{ #category : 'visiting' }
DTRTDTestCaseNode >> acceptVisitor: aDTResultsTreeVisitor [
	^ subResults do: [ :subResult | subResult acceptVisitor: aDTResultsTreeVisitor ]
]

{ #category : 'testing' }
DTRTDTestCaseNode >> canBeBrowsed [
	^ true
]

{ #category : 'actions' }
DTRTDTestCaseNode >> drTestsBrowse [ 

	^ testCaseMessages testMethod drTestsBrowse 
]

{ #category : 'accessing' }
DTRTDTestCaseNode >> drTestsName [
	
	^ String streamContents: [ :stream | 
		stream
			<< testCaseMessages testCase selector;
			<< ' (';
			<< testCaseMessages messages size asString;
			<< ')' ]
]

{ #category : 'accessing' }
DTRTDTestCaseNode >> messages: aTestCaseMessages [

	testCaseMessages := aTestCaseMessages.
	subResults := DTRTDMessageNode toNodes: aTestCaseMessages messages
]

{ #category : 'accessing' }
DTRTDTestCaseNode >> subResults [ 
	
	^ subResults 
]
