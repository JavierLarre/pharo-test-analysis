"
I wrap RTFSelfCallsInterpreter
"
Class {
	#name : 'MaSelfCallsFinder',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'api' }
MaSelfCallsFinder >> selfCalls: aCompiledMethod [ 
	^ self subclassResponsibility
]
