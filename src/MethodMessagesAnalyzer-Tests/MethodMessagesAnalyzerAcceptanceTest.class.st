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
	analyzer := MaMethodAnalyzer new
]

{ #category : 'tests' }
MethodMessagesAnalyzerAcceptanceTest >> testAreConnected [

	| rootMethod |
	rootMethod := MaAcceptanceFixture >> #root .
	analyzer
		analyzeMethod: rootMethod;
		analyzeMethod: MaAcceptanceFixture >> #x .

	self 
		assert: (analyzer messages method: rootMethod isConnectedToMessage: #x) ;
		deny: (analyzer messages method: rootMethod isConnectedToMessage: #cycle1) .
		
	analyzer analyzeMethod: MaAcceptanceFixture >> #z .
	
	self assert: (analyzer messages method: rootMethod isConnectedToMessage: #cycle1) 
]
