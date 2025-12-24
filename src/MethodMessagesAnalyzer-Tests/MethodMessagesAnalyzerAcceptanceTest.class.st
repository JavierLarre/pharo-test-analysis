Class {
	#name : 'MethodMessagesAnalyzerAcceptanceTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MethodMessagesAnalyzerAcceptanceTest >> setUp [
	super setUp.
	analyzer := MethodMessagesAnalyzer new 
]

{ #category : 'tests' }
MethodMessagesAnalyzerAcceptanceTest >> testAreConnected [

	| rootMethod |
	rootMethod := MethodMessagesAnalyzerGraphFixture >> #root .
	analyzer
		analyzeMethod: rootMethod;
		analyzeMethod: MethodMessagesAnalyzerGraphFixture >> #x .

	self assert: (analyzer result method: rootMethod isConnectedToMessage: #x)
]
