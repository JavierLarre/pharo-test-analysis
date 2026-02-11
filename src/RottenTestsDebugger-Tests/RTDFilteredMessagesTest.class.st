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

	messages := RTDFilteredMessages new
		bannedMessages: { #assert: } asSet;
		yourself
]

{ #category : 'tests' }
RTDFilteredMessagesTest >> testFilteredMessages [

	| compiledMethod |
	compiledMethod := self buildDummyMethod: #foo.
	
	messages 
		at: compiledMethod 
		put: { #foo . #bar . #assert: } asSet.
	
	self
		assertCollection: (messages at: compiledMethod ) 
		equals: { #foo . #bar } asSet
]

{ #category : 'tests' }
RTDFilteredMessagesTest >> testMethodsThatInclude [ 

	| foo includesFoo |
	foo := self buildDummyMethod: #foo.
	includesFoo := self buildDummyMethod: #includesFoo.
	
	messages 
		bannedMessages: { #assert: . #deny: } asSet ;
		at: foo put: { #foo . #bar . #assert: } asSet;
		at: includesFoo put: { #foo . #bar . #deny: } asSet .
	
	self
		assertCollection: (messages methodsThatInclude: foo) 
		hasSameElements: { includesFoo } 
]
