"
I am an abstract visitor of test cases. I provide a hook for building the view model
"
Class {
	#name : 'DTRTDTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'methodVisitor'
	],
	#category : 'DrTests-RottenTestsDebugger-visitor',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'visitor'
}

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildTestCaseMessages: aTestCase [

	^ DTRTDTestCaseMessages new
		  testCase: aTestCase;
		  testMethod: (self testCaseMethod: aTestCase );
		  yourself
]

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildViewModel: aViewModel [
	"hook for setting variables into the model"
]

{ #category : 'utilities' }
DTRTDTestCaseVisitor >> filterEmptyMessages: aMessagesCollection [

	^ aMessagesCollection reject: [ :testMessages | testMessages messages isEmpty ]
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

	methodVisitor analyzeMethod: (self testCaseMethod: aTestCase ).
]
