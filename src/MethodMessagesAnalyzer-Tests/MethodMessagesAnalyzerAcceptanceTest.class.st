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
	rootMethod := MaAcceptanceFixture >> #root .
	analyzer
		analyzeMethod: rootMethod;
		analyzeMethod: MaAcceptanceFixture >> #x .

	self 
		assert: (analyzer result method: rootMethod isConnectedToMessage: #x) ;
		deny: (analyzer result method: rootMethod isConnectedToMessage: #cycle1) .
		
	analyzer analyzeMethod: MaAcceptanceFixture >> #z .
	
	self assert: (analyzer result method: rootMethod isConnectedToMessage: #cycle1) 
]
