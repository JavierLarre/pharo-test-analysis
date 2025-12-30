"
I provide the service to get helper methods ie. messages sent to self
"
Class {
	#name : 'MaSelfCallsFinder',
	#superclass : 'Object',
	#instVars : [
		'interpreter'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaSelfCallsFinder >> interpreter: anInterpreter [ 

	interpreter := anInterpreter 
]

{ #category : 'api' }
MaSelfCallsFinder >> selfCalls: aCompiledMethod [

	^ interpreter 
		send: aCompiledMethod selector fromClass: aCompiledMethod methodClass;
		selfSentMethods 
]
