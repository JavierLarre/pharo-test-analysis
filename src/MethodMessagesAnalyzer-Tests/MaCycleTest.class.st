Class {
	#name : 'MaCycleTest',
	#superclass : 'TestCase',
	#instVars : [
		'analyzer'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaCycleTest >> setUp [
	super setUp.
	analyzer := MaMethodAnalyzer new
]

{ #category : 'tests' }
MaCycleTest >> testCycle [ 

	| rootMethod |
	rootMethod := MaFixtureWithCycles >> #root .
	analyzer
		analyzeMethod: rootMethod;
		analyzeMethod: MaFixtureWithCycles >> #x .

	self 
		assert: (analyzer messages method: rootMethod isConnectedToMessage: #x) ;
		deny: (analyzer messages method: rootMethod isConnectedToMessage: #cycle1) .
		
	analyzer analyzeMethod: MaFixtureWithCycles >> #z .
	
	self assert: (analyzer messages method: rootMethod isConnectedToMessage: #cycle1) 
]
