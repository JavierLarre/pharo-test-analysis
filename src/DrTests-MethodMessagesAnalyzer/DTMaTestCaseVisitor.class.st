Class {
	#name : 'DTMaTestCaseVisitor',
	#superclass : 'SUnitVisitor',
	#instVars : [
		'analysisData'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
DTMaTestCaseVisitor >> analysisData [

	^ analysisData
]

{ #category : 'accessing' }
DTMaTestCaseVisitor >> analysisData: anObject [

	analysisData := anObject
]

{ #category : 'initialization' }
DTMaTestCaseVisitor >> initialize [ 
	
	super initialize.
	self analysisData: OrderedCollection new.
]

{ #category : 'visiting' }
DTMaTestCaseVisitor >> visitTestCase: aTestCase [
	
	self analysisData 
		add: 
			(DTMaAnalysisData new
				testCase: aTestCase;
				analyserVisitor: (MaMessageVisitor new analyzeMethod: aTestCase class >> aTestCase selector);
				yourself)
]
