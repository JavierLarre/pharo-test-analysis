"
I return the calls previously given by me, empty by default
"
Class {
	#name : 'MaSelfCallsFinderStub',
	#superclass : 'MaSelfCallsFinder',
	#instVars : [
		'calls'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaSelfCallsFinderStub >> calls: aCollection [

	calls := aCollection
]

{ #category : 'initialization' }
MaSelfCallsFinderStub >> initialize [ 

	super initialize.
	calls := Array new 
]

{ #category : 'api' }
MaSelfCallsFinderStub >> selfCalls: aCompiledMethod [
	^ calls 
]
