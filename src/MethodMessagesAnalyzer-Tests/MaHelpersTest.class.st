Class {
	#name : 'MaHelpersTest',
	#superclass : 'TestCase',
	#instVars : [
		'helpers'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaHelpersTest >> setUp [

	super setUp.

	helpers := MaHelpers new
		           yourself
]

{ #category : 'tests' }
MaHelpersTest >> testSelectors [

	| messages method |
	method := CompiledMethod new selector: #foo; yourself.
	messages := MaMessages new
		            atMethod: method putMessages: #( assert: );
		            yourself.

	self assert: (messages method: method isConnectedToMessage: #assert: )
]
