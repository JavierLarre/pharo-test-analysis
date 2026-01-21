Class {
	#name : 'RTDHelpersTest',
	#superclass : 'TestCase',
	#instVars : [
		'helpers'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'running' }
RTDHelpersTest >> setUp [

	super setUp.

	helpers := RTDHelpers new
		           yourself
]

{ #category : 'tests' }
RTDHelpersTest >> testSelectors [

	| messages method |
	method := CompiledMethod new selector: #foo; yourself.
	messages := RTDMessages new
		            atMethod: method putMessages: #( assert: );
		            yourself.

	self assert: (messages method: method isConnectedToMessage: #assert: )
]
