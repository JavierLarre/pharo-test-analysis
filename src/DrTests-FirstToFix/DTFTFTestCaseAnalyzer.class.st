"
I am an abstract visitor of test cases. I provide a hook for building the view model
"
Class {
	#name : 'DTFTFTestCaseAnalyzer',
	#superclass : 'Object',
	#instVars : [
		'methodVisitor',
		'methodViewModels'
	],
	#category : 'DrTests-FirstToFix-Visitors',
	#package : 'DrTests-FirstToFix',
	#tag : 'Visitors'
}

{ #category : 'testing' }
DTFTFTestCaseAnalyzer class >> isAbstract [ 

	^ self = DTFTFTestCaseAnalyzer 
]

{ #category : 'accessing' }
DTFTFTestCaseAnalyzer class >> methodVisitor: aMethodVisitor [

	^ self new methodVisitor: aMethodVisitor; yourself
]

{ #category : 'visiting' }
DTFTFTestCaseAnalyzer >> analyzeTestCase: aTestCase [

	| testCaseViewModel |
	testCaseViewModel := self methodViewModelClass new.
	self methodVisitor analyzeMethod: aTestCase compiledMethod.
	self buildMethodViewModel: testCaseViewModel withTestCase: aTestCase.
	self methodViewModels add: testCaseViewModel
]

{ #category : 'building' }
DTFTFTestCaseAnalyzer >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	aMethodViewModel
		compiledMethod: aTestCase compiledMethod
]

{ #category : 'building' }
DTFTFTestCaseAnalyzer >> buildViewModel: aViewModel [
	"hook for setting variables into the model"
]

{ #category : 'utilities' }
DTFTFTestCaseAnalyzer >> filterEmptyMessages: aMethodViewModelCollection [

	^ aMethodViewModelCollection reject: [ :aMethodViewModel | aMethodViewModel messages isEmpty ]
]

{ #category : 'factory' }
DTFTFTestCaseAnalyzer >> methodViewModelClass [

	^ DTFTFMethodData
]

{ #category : 'accessing' }
DTFTFTestCaseAnalyzer >> methodViewModels [

	^ methodViewModels ifNil: [ methodViewModels := OrderedCollection new ]
]

{ #category : 'accessing' }
DTFTFTestCaseAnalyzer >> methodViewModels: anObject [

	methodViewModels := anObject
]

{ #category : 'accessing' }
DTFTFTestCaseAnalyzer >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := self methodVisitorClass new ]
]

{ #category : 'accessing' }
DTFTFTestCaseAnalyzer >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'factory' }
DTFTFTestCaseAnalyzer >> methodVisitorClass [

	^ self subclassResponsibility 
]
