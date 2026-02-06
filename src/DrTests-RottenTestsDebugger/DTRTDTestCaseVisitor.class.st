"
I am an abstract visitor of test cases. I provide a hook for building the view model
"
Class {
	#name : 'DTRTDTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'methodVisitor',
		'methodViewModels'
	],
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	aMethodViewModel
		compiledMethod: (self testCaseMethod: aTestCase )
]

{ #category : 'building' }
DTRTDTestCaseVisitor >> buildViewModel: aViewModel [
	"hook for setting variables into the model"
]

{ #category : 'utilities' }
DTRTDTestCaseVisitor >> filterEmptyMessages: aMethodViewModelCollection [

	^ aMethodViewModelCollection reject: [ :aMethodViewModel | aMethodViewModel messages isEmpty ]
]

{ #category : 'factory' }
DTRTDTestCaseVisitor >> methodViewModelClass [

	^ DTRTDMethodViewModel
]

{ #category : 'accessing' }
DTRTDTestCaseVisitor >> methodViewModels [

	^ methodViewModels ifNil: [ methodViewModels := OrderedCollection new ]
]

{ #category : 'accessing' }
DTRTDTestCaseVisitor >> methodViewModels: anObject [

	methodViewModels := anObject
]

{ #category : 'accessing' }
DTRTDTestCaseVisitor >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := self methodVisitorClass new ]
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
		print: self methodVisitor;
		<< ', testCases: '.
	self methodViewModels do: [ :methodViewModel | aStream print: methodViewModel ]
]

{ #category : 'utilities' }
DTRTDTestCaseVisitor >> testCaseMethod: aTestCase [

	^ (aTestCase class lookupSelector: aTestCase selector )
		ifNil: [ Error signal: 'test method not found' ]
]

{ #category : 'visiting' }
DTRTDTestCaseVisitor >> visitTestCase: aTestCase [

	| testCaseViewModel |
	self methodVisitor analyzeMethod: (self testCaseMethod: aTestCase).
	testCaseViewModel := self methodViewModelClass new.
	self buildMethodViewModel: testCaseViewModel withTestCase: aTestCase.
	self methodViewModels add: testCaseViewModel
]
