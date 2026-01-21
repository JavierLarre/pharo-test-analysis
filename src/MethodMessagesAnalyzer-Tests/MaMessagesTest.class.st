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
MaMessagesTest >> buildDummyMethod: aSelector [

	^ CompiledMethod new 
		selector: aSelector;
		yourself
]

{ #category : 'running' }
MaMessagesTest >> setUp [
	super setUp.

	messages := MaMessages new.
]

{ #category : 'tests' }
MaMessagesTest >> testAnyMessagesAreConnected [

	| method |
	
	method := self buildDummyMethod: #foo.
	
	messages atMethod: method putMessages: { #= . #+ . #< }.
	
	self
		assert: (messages method: method isConnectedToAnyMessage: { #+ . #- . #>= })
]

{ #category : 'tests' }
MaMessagesTest >> testConnectionIsTransitive [

	| callsFoo instanceFoo classFoo |
	callsFoo := self buildDummyMethod: #callsFoo.
	instanceFoo := self buildDummyMethod: #foo.
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
	root := self buildDummyMethod: #callsCycle.

	messages 
		atMethod: root putMessages: { #cycle1 . #x };
		atMethod: (self buildDummyMethod: #cycle1) putMessages: { #cycle2 . #y };
		atMethod: (self buildDummyMethod: #cycle2) putMessages: { #cycle1 . #z }.

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
	method := self buildDummyMethod: #foo.

	messages atMethod: method putMessages: #( x y ).

	self assertCollection: (messages atMethod: method) hasSameElements: { #x. #y }
]

{ #category : 'tests' }
MaMessagesTest >> testIncludesSubmethods [

	| foo containedFoo |
	foo := self buildDummyMethod: #foo.
	containedFoo := self buildDummyMethod: #bar.
	
	messages 
		atMethod: foo putMessages: #( a b c x y z );
		atMethod: containedFoo putMessages: #( a c x y ).
		
	self assert: (messages method: foo includesSubmethod: containedFoo )
]

{ #category : 'tests' }
MaMessagesTest >> testIsConnected [

	| callsFoo foo |
	callsFoo := self buildDummyMethod: #callsFoo.
	foo := self buildDummyMethod: #foo.

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
	method := self buildDummyMethod: #foo.
	
	messages 
		atMethod: method putMessages: #( a b c x y z ).
		
	self assert: (messages method: method includesSubmethod: method)
]

{ #category : 'tests' }
MaMessagesTest >> testNestedMessagesAreConnected [

	| method |
	
	method := self buildDummyMethod: #foo.
	
	messages 
		atMethod: method putMessages: { #= . #+ . #< };
		atMethod: (self buildDummyMethod: #= ) putMessages: { #>= . #<= } .
	
	self
		assert: (messages method: method isConnectedToAnyMessage: { #- . #>= })
]

{ #category : 'tests' }
MaMessagesTest >> testNoMessageIsConnected [

	| method |
	
	method := self buildDummyMethod: #foo.
	
	messages
		atMethod: method putMessages: { #= . #+ . #< };
		atMethod: (self buildDummyMethod: #= ) putMessages: { #assert: . #plus . #minus };
		atMethod: (self buildDummyMethod: #+) putMessages: { #= . #+ . #foo };
		atMethod: (self buildDummyMethod: #< ) putMessages: {  } .
	
	self
		deny: (messages method: method isConnectedToAnyMessage: { #/ . #- . #>= })
]

{ #category : 'tests' }
MaMessagesTest >> testRaisesNotFound [

	| method |
	method := self buildDummyMethod: #foo.
	
	self
		should: [ messages atMethod: method ] raise: MethodNotFound;
		should: [ messages method: method isConnectedToMessage: #bar ] raise: MethodNotFound;
		should: [ messages method: method includesMessage: #foo ] raise: MethodNotFound;
		should: [ messages method: method includesSubmethod: method ] raise: MethodNotFound
]
