"
A MaFilteredMessagesTest is a test class for testing the behavior of MaFilteredMessages
"
Class {
	#name : 'RTDFilteredMessagesTest',
	#superclass : 'RTDMessagesTest',
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'running' }
RTDFilteredMessagesTest >> setUp [
	super setUp.

	messages := MaFilteredMessages new.
]

{ #category : 'tests' }
RTDFilteredMessagesTest >> testFilteredMessages [

	| compiledMethod |
	messages bannedMessages: { #assert: } asSet.
	compiledMethod := self buildDummyMethod: #foo.
	
	messages 
		at: compiledMethod 
		put: { #foo . #bar . #assert: } asSet.
	
	self
		assertCollection: (messages at: compiledMethod ) 
		equals: { #foo . #bar } asSet
]
