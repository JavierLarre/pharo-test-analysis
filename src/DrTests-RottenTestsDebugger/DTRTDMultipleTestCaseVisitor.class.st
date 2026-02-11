"
I work as a proxy/decorator for multiple classes of `DTRTDTestCaseVisitor`
"
Class {
	#name : 'DTRTDMultipleTestCaseVisitor',
	#superclass : 'DTRTDTestCaseVisitor',
	#instVars : [
		'visitorClasses'
	],
	#category : 'DrTests-RottenTestsDebugger-Visitors',
	#package : 'DrTests-RottenTestsDebugger',
	#tag : 'Visitors'
}

{ #category : 'instance creation' }
DTRTDMultipleTestCaseVisitor class >> withClasses: aClassCollection [

	^ self new visitorClasses: aClassCollection; yourself 
]

{ #category : 'building' }
DTRTDMultipleTestCaseVisitor >> buildMethodViewModel: aMethodViewModel withTestCase: aTestCase [

	self methodVisitorsDo: [ :visitor | 
		visitor buildMethodViewModel: aMethodViewModel withTestCase: aTestCase ]
]

{ #category : 'building' }
DTRTDMultipleTestCaseVisitor >> buildViewModel: aViewModel [
	
	self methodVisitorsDo: [ :visitor | visitor buildViewModel: aViewModel ]
]

{ #category : 'accessing' }
DTRTDMultipleTestCaseVisitor >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := self visitorClasses collect: [ :visitorClass | 
			visitorClass new ] ]
]

{ #category : 'factory' }
DTRTDMultipleTestCaseVisitor >> methodVisitorClass [

	^ nil
]

{ #category : 'enumerating' }
DTRTDMultipleTestCaseVisitor >> methodVisitorsDo: aBlock [

	self methodVisitor do: aBlock 
]

{ #category : 'printing' }
DTRTDMultipleTestCaseVisitor >> printOn: aStream [

	super printOn: aStream.
	aStream 
		<< ' visitor: ';
		nextPutAll: self methodVisitor;
		<< ', testCases: '.
	self methodViewModels do: [ :methodViewModel | aStream print: methodViewModel ]
]

{ #category : 'visiting' }
DTRTDMultipleTestCaseVisitor >> visitTestCase: aTestCase [

	^ self methodVisitorsDo: [ :visitor | visitor visitTestCase: aTestCase ]
]

{ #category : 'accessing' }
DTRTDMultipleTestCaseVisitor >> visitorClasses [

	^ visitorClasses ifNil: [ visitorClasses := OrderedCollection new ]
]

{ #category : 'accessing' }
DTRTDMultipleTestCaseVisitor >> visitorClasses: anObject [

	visitorClasses := anObject
]
