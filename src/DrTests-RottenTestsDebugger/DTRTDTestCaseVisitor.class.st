"
I am an abstract visitor of test cases. I provide a hook for building the view model
"
Class {
	#name : 'DTRTDTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'methodVisitor',
		'testCasesViewModels'
	],
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	aTestCaseViewModel
		testMethod: (self testCaseMethod: aTestCase )
]

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildViewModel: aViewModel [
	"hook for setting variables into the model"
]

{ #category : 'utilities' }
DTRTDTestCaseVisitor >> filterEmptyMessages: aMessagesCollection [

	^ aMessagesCollection reject: [ :testMessages | testMessages messages isEmpty ]
]

{ #category : 'initialization' }
DTRTDTestCaseVisitor >> initialize [

	super initialize.
	methodVisitor := self methodVisitorClass new.
	testCasesViewModels := OrderedCollection new.
]

{ #category : 'accessing' }
DTRTDTestCaseVisitor >> methodVisitor [

	^ methodVisitor
]

{ #category : 'accessing' }
DTRTDTestCaseVisitor >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'factory' }
DTRTDTestCaseVisitor >> methodVisitorClass [

	^ self subclassResponsibility 
]

{ #category : 'printing' }
DTRTDTestCaseVisitor >> printOn: aStream [

	super printOn: aStream.
	aStream 
		<< ' visitor: ';
		print: methodVisitor;
		<< ', testCases: ';
		nextPutAll: testCasesViewModels;
		<< ')'
]

{ #category : 'utilities' }
DTRTDTestCaseVisitor >> testCaseMethod: aTestCase [

	^ aTestCase class >> aTestCase selector
]

{ #category : 'factory' }
DTRTDTestCaseVisitor >> testCaseViewModelClass [

	^ DTRTDTestCaseViewModel
]

{ #category : 'visiting' }
DTRTDTestCaseVisitor >> visitTestCase: aTestCase [

	| testCaseViewModel |
	methodVisitor analyzeMethod: (self testCaseMethod: aTestCase).
	testCaseViewModel := self testCaseViewModelClass new.
	self buildTestCaseViewModel: testCaseViewModel withTestCase: aTestCase.
	testCasesViewModels add: testCaseViewModel
]
