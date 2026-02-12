"
I am an abstract visitor of test cases. I provide a hook for building the view model
"
Class {
	#name : 'DTRTDAnalysisStrategy',
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
DTRTDAnalysisStrategy class >> isAbstract [ 

	^ self = DTRTDAnalysisStrategy 
]

{ #category : 'visiting' }
DTRTDAnalysisStrategy >> analyzeTestCase: aTestCase [

	| testCaseViewModel |
	self methodVisitor analyzeMethod: aTestCase compiledMethod.
	testCaseViewModel := self methodViewModelClass new.
	self buildMethodViewModel: testCaseViewModel withTestCase: aTestCase.
	self methodViewModels add: testCaseViewModel
]

{ #category : 'building' }
DTRTDAnalysisStrategy >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	aMethodViewModel
		compiledMethod: (self testCaseMethod: aTestCase )
]

{ #category : 'building' }
DTRTDAnalysisStrategy >> buildViewModel: aViewModel [
	"hook for setting variables into the model"
]

{ #category : 'utilities' }
DTRTDAnalysisStrategy >> filterEmptyMessages: aMethodViewModelCollection [

	^ aMethodViewModelCollection reject: [ :aMethodViewModel | aMethodViewModel messages isEmpty ]
]

{ #category : 'factory' }
DTRTDAnalysisStrategy >> methodViewModelClass [

	^ DTRTDMethodData
]

{ #category : 'accessing' }
DTRTDAnalysisStrategy >> methodViewModels [

	^ methodViewModels ifNil: [ methodViewModels := OrderedCollection new ]
]

{ #category : 'accessing' }
DTRTDAnalysisStrategy >> methodViewModels: anObject [

	methodViewModels := anObject
]

{ #category : 'accessing' }
DTRTDAnalysisStrategy >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := self methodVisitorClass new ]
]

{ #category : 'accessing' }
DTRTDAnalysisStrategy >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'factory' }
DTRTDAnalysisStrategy >> methodVisitorClass [

	^ self subclassResponsibility 
]

{ #category : 'utilities' }
DTRTDAnalysisStrategy >> testCaseMethod: aTestCase [

	^ (aTestCase class lookupSelector: aTestCase selector )
		ifNil: [ Error signal: 'test method not found' ]
]
