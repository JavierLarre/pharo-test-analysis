Class {
	#name : 'DTMaTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'methodVisitor',
		'testCasesMessages'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'initialization' }
DTMaTestCaseVisitor >> initialize [

	super initialize.
	testCasesMessages := SortedCollection new 
		sort: [ :testCaseMessages1 :testCaseMessages2 | 
			methodVisitor messages method: testCaseMessages1 testMethod containsSubmethod: testCaseMessages2 testMethod ] .
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> methodVisitor [

	^ methodVisitor
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> testCasesMessages [

	^ testCasesMessages
]

{ #category : 'visiting' }
DTMaTestCaseVisitor >> visitTestCase: aTestCase [

	| compiledMethod |
	compiledMethod := aTestCase class >> aTestCase selector.

	methodVisitor analyzeMethod: compiledMethod.
	testCasesMessages add: (DTMaTestCaseMessages new
			testCase: aTestCase;
			testMethod: compiledMethod;
			messages: (methodVisitor messages methodMessages: compiledMethod) asOrderedCollection ;
			 yourself)
]
