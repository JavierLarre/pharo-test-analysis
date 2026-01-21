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
		assert: (messages method: root isConnectedToMessage: #z);
		deny: (messages method: root isConnectedToMessage: #aaaaaa)
]

{ #category : 'tests' }
MaMessagesTest >> testEmpty [

	self 
		assertEmpty: messages;
		deny: (messages message: #foo isConnectedTo: #bar )
]

{ #category : 'tests' }
MaMessagesTest >> testHasMessages [

	| method |
	method := self fixtureMethod: #foo.

	messages atMethod: method putMessages: #( x y ).

	self assertCollection: (messages atMethod: method) hasSameElements: { #x. #y }
]

{ #category : 'tests' }
MaMessagesTest >> testIncludesSubmethods [

	| foo containedFoo |
	foo := self fixtureMethod: #foo.
	containedFoo := self fixtureMethod: #bar.
	
	messages 
		atMethod: foo putMessages: #( a b c x y z );
		atMethod: containedFoo putMessages: #( a c x y ).
		
	self assert: (messages method: foo includesSubmethod: containedFoo )
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

{ #category : 'tests' }
MaMessagesTest >> testMessagesIncludesThemselves [

	| method |
	method := self fixtureMethod: #foo.
	
	messages 
		atMethod: method putMessages: #( a b c x y z ).
		
	self assert: (messages method: method includesSubmethod: method)
]

{ #category : 'tests' }
MaMessagesTest >> testRaisesNotFound [

	| method |
	method := self fixtureMethod: #foo.
	
	self
		should: [ messages atMethod: method ] raise: MethodNotFound;
		should: [ messages method: method isConnectedToMessage: #bar ] raise: MethodNotFound;
		should: [ messages method: method includesMessage: #foo ] raise: MethodNotFound;
		should: [ messages method: method includesSubmethod: method ] raise: MethodNotFound
]
