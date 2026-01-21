"
A MaFilteredMessagesTest is a test class for testing the behavior of MaFilteredMessages
"
Class {
	#name : 'MaFilteredMessagesTest',
	#superclass : 'MaMessagesTest',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'running' }
MaFilteredMessagesTest >> setUp [
	super setUp.

	messages := MaFilteredMessages new.
]

{ #category : 'tests' }
MaFilteredMessagesTest >> testFilteredMessages [

	| compiledMethod |
	messages bannedMessages: { #assert: } asSet.
	compiledMethod := self fixtureMethod: #foo.
	
	messages 
		atMethod: compiledMethod 
		putMessages: { #foo . #bar . #assert: } asSet.
	
	self
		assertCollection: (messages atMethod: compiledMethod ) 
		equals: { #foo . #bar } asSet
]
