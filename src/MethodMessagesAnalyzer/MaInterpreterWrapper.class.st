"
I provide the service to get helper methods ie. messages sent to self
"
Class {
	#name : 'MaInterpreterWrapper',
	#superclass : 'MaSelfCallsFinder',
	#instVars : [
		'interpreter'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaInterpreterWrapper >> interpreter: anInterpreter [ 

	interpreter := anInterpreter 
]

{ #category : 'api' }
MaInterpreterWrapper >> selfCalls: aCompiledMethod [

	^ interpreter 
		send: aCompiledMethod selector fromClass: aCompiledMethod methodClass;
		selfSentMethods 
]
