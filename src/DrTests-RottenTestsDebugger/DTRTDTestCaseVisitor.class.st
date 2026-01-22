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
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'factory' }
DTRTDTestCaseVisitor class >> methodVisitorClass [

	^ self subclassResponsibility 
]

{ #category : 'factory' }
DTRTDTestCaseVisitor class >> testCaseViewModelClass [

	^ DTRTDTestCaseMessages
]

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildTestCaseMessages: aTestCase [

	^ self class testCaseViewModelClass new
		  testCase: aTestCase;
		  testMethod: (self testCaseMethod: aTestCase );
		  yourself
]

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildTestCaseViewModel: aTestCaseViewModel withTestCase: aTestCase [

	aTestCaseViewModel
		testCase: aTestCase;
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
	methodVisitor := self class methodVisitorClass new.
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

{ #category : 'utilities' }
DTRTDTestCaseVisitor >> testCaseMethod: aTestCase [

	^ aTestCase class >> aTestCase selector
]

{ #category : 'visiting' }
DTRTDTestCaseVisitor >> visitTestCase: aTestCase [

	| testCaseViewModel |
	methodVisitor analyzeMethod: (self testCaseMethod: aTestCase).
	testCaseViewModel := self class testCaseViewModelClass new.
	self buildTestCaseViewModel: testCaseViewModel withTestCase: aTestCase.
	testCasesViewModels add: testCaseViewModel
]
