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
			<< name;
			<< ' (';
			<< testCaseMessages messages size asString;
			<< ')' ]
]

{ #category : 'accessing' }
DTRTDTestCaseNode >> messages: aTestCaseMessages [

	testCaseMessages := aTestCaseMessages.
	name := aTestCaseMessages testCase selector.
	subResults := DTRTDMessageNode toNodes: aTestCaseMessages messages
]

{ #category : 'accessing' }
DTRTDTestCaseNode >> subResults [ 
	
	^ subResults 
]
