"
I work as a proxy/decorator for multiple classes of `DTRTDTestCaseVisitor`
"
Class {
	#name : 'DTRTDMultipleTestCaseVisitor',
	#superclass : 'DTRTDAnalysisStrategy',
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

{ #category : 'visiting' }
DTRTDMultipleTestCaseVisitor >> analyzeTestCase: aTestCase [

	^ self methodVisitorsDo: [ :visitor | visitor analyzeTestCase: aTestCase ]
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

{ #category : 'accessing' }
DTRTDMultipleTestCaseVisitor >> visitorClasses [

	^ visitorClasses ifNil: [ visitorClasses := OrderedCollection new ]
]

{ #category : 'accessing' }
DTRTDMultipleTestCaseVisitor >> visitorClasses: anObject [

	visitorClasses := anObject
]
