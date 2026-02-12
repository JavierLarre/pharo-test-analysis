"
I am an abstract visitor of test cases. I provide a hook for building the view model
"
Class {
	#name : 'DTRTDTestCaseAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'methodVisitor',
		'methodViewModels'
	],
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'testing' }
DTRTDTestCaseAnalyzer class >> isAbstract [ 

	^ self = DTRTDTestCaseAnalyzer 
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer class >> methodVisitor: aMethodVisitor [

	^ self new methodVisitor: aMethodVisitor; yourself
]

{ #category : 'visiting' }
DTRTDTestCaseAnalyzer >> analyzeTestCase: aTestCase [

	| testCaseViewModel |
	testCaseViewModel := self methodViewModelClass new.
	self methodVisitor analyzeMethod: aTestCase compiledMethod.
	self buildMethodViewModel: testCaseViewModel withTestCase: aTestCase.
	self methodViewModels add: testCaseViewModel
]

{ #category : 'building' }
DTRTDTestCaseAnalyzer >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	aMethodViewModel
		compiledMethod: aTestCase compiledMethod
]

{ #category : 'building' }
DTRTDTestCaseAnalyzer >> buildViewModel: aViewModel [
	"hook for setting variables into the model"
]

{ #category : 'utilities' }
DTRTDTestCaseAnalyzer >> filterEmptyMessages: aMethodViewModelCollection [

	^ aMethodViewModelCollection reject: [ :aMethodViewModel | aMethodViewModel messages isEmpty ]
]

{ #category : 'factory' }
DTRTDTestCaseAnalyzer >> methodViewModelClass [

	^ DTRTDMethodData
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> methodViewModels [

	^ methodViewModels ifNil: [ methodViewModels := OrderedCollection new ]
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> methodViewModels: anObject [

	methodViewModels := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := self methodVisitorClass new ]
]

{ #category : 'accessing' }
DTRTDTestCaseAnalyzer >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'factory' }
DTRTDTestCaseAnalyzer >> methodVisitorClass [

	^ self subclassResponsibility 
]
