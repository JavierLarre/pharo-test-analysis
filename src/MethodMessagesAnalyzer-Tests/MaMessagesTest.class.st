Class {
	#name : 'MaMessagesTest',
	#superclass : 'TestCase',
	#instVars : [
		'messages'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'utilities' }
MaMessagesTest >> fixtureMethod: aSelector [

	^ MaMessagesFixture >> aSelector 
]

{ #category : 'running' }
MaMessagesTest >> setUp [
	super setUp.

	messages := MaMessages new.
]

{ #category : 'tests' }
MaMessagesTest >> testConnectionIsTransitive [

	| callsFoo instanceFoo classFoo |
	callsFoo := self fixtureMethod: #callsFoo.
	instanceFoo := self fixtureMethod: #foo.
	classFoo := MaMessagesFixture class >> #foo.

	messages 
		atMethod: instanceFoo putMessages: { #x. #y };
		atMethod: callsFoo putMessages: { #foo };
		atMethod: classFoo putMessages: { #xxx . #yyy }.

	self 
		assert: (messages method: callsFoo isConnectedToMessage: #x);
		assert: (messages method: callsFoo isConnectedToMessage: #xxx)
]

{ #category : 'tests' }
MaMessagesTest >> testCycle [

	| root |
	root := self fixtureMethod: #callsCycle.

	messages 
		atMethod: root putMessages: { #cycle1 . #x };
		atMethod: (self fixtureMethod: #cycle1) putMessages: { #cycle2 . #y };
		atMethod: (self fixtureMethod: #cycle2) putMessages: { #cycle1 . #z }.

	self 
		skip: 'i just found this';
		assert: (messages method: root isConnectedToMessage: #z);
		deny: (messages method: root isConnectedToMessage: #aaaaaa)
]

{ #category : 'tests' }
MaMessagesTest >> testHasMessages [

	| method |
	method := self fixtureMethod: #foo.

	messages atMethod: method putMessages: #( x y ).

	self assertCollection: (messages methodMessages: method) hasSameElements: { #x. #y }
]

{ #category : 'tests' }
MaMessagesTest >> testIsConnected [

	| callsFoo foo |
	callsFoo := self fixtureMethod: #callsFoo.
	foo := self fixtureMethod: #foo.

	messages 
		atMethod: foo putMessages: { #x. #y };
		atMethod: callsFoo putMessages: { #foo }.

	self 
		assert: (messages method: foo isConnectedToMessage: #x);
		assert: (messages method: callsFoo isConnectedToMessage: #x)
]
