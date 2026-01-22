Class {
	#name : 'RTDMessagesTest',
	#superclass : 'TestCase',
	#instVars : [
		'messages'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'utilities' }
RTDMessagesTest >> buildDummyMethod: aSelector [

	^ CompiledMethod new 
		selector: aSelector;
		yourself
]

{ #category : 'running' }
RTDMessagesTest >> setUp [
	super setUp.

	messages := RTDMessages new.
]

{ #category : 'tests' }
RTDMessagesTest >> testAnyMessagesAreConnected [

	| method |
	
	method := self buildDummyMethod: #foo.
	
	messages at: method put: { #= . #+ . #< }.
	
	self
		assert: (messages is: method connectedToAny: { #+ . #- . #>= })
]

{ #category : 'tests' }
RTDMessagesTest >> testConnectionWithSameMessages [

	| callsFoo instanceFoo classFoo |
	callsFoo := self buildDummyMethod: #callsFoo.
	instanceFoo := self buildDummyMethod: #foo.
	classFoo := self buildDummyMethod: #foo.
	classFoo methodClass: self class.

	messages 
		at: instanceFoo put: { #x. #y };
		at: callsFoo put: { #foo };
		at: classFoo put: { #xxx . #yyy }.

	self 
		assert: (messages is: callsFoo connectedTo: #x);
		assert: (messages is: callsFoo connectedTo: #xxx)
]

{ #category : 'tests' }
RTDMessagesTest >> testCycle [

	| root |
	root := self buildDummyMethod: #callsCycle.

	messages 
		at: root put: { #cycle1 . #x };
		at: (self buildDummyMethod: #cycle1) put: { #cycle2 . #y };
		at: (self buildDummyMethod: #cycle2) put: { #cycle1 . #z }.

	self 
		assert: (messages is: root connectedTo: #z);
		deny: (messages is: root connectedTo: #aaaaaa)
]

{ #category : 'tests' }
RTDMessagesTest >> testEmpty [

	self 
		assertEmpty: messages
]

{ #category : 'tests' }
RTDMessagesTest >> testHasMessages [

	| method |
	method := self buildDummyMethod: #foo.

	messages at: method put: #( x y ).

	self assertCollection: (messages at: method) hasSameElements: { #x. #y }
]

{ #category : 'tests' }
RTDMessagesTest >> testIncludesSubmethods [

	| foo containedFoo containedFoo2 |
	foo := self buildDummyMethod: #foo.
	containedFoo := self buildDummyMethod: #containedFoo.
	containedFoo2 := self buildDummyMethod: #containedFoo2.
	
	messages 
		at: foo put: #( a b c x y z );
		at: containedFoo put: #( a c x y );
		at: containedFoo2 put: #( a b z ) .
		
	self 
		assertCollection: (messages subMethodsIncludedBy: foo ) 
		hasSameElements: { containedFoo . containedFoo2  }
]

{ #category : 'tests' }
RTDMessagesTest >> testIsConnected [

	| callsFoo foo |
	callsFoo := self buildDummyMethod: #callsFoo.
	foo := self buildDummyMethod: #foo.

	messages 
		at: foo put: { #x. #y };
		at: callsFoo put: { #foo }.

	self 
		assert: (messages is: foo connectedTo: #x);
		assert: (messages is: callsFoo connectedTo: #x)
]

{ #category : 'tests' }
RTDMessagesTest >> testMessagesIncludesThemselves [

	| method |
	method := self buildDummyMethod: #foo.
	
	messages 
		at: method put: #( a b c x y z ).
		
	self assert: (messages does: method includesSubmethod: method)
]

{ #category : 'tests' }
RTDMessagesTest >> testNestedMessagesAreConnected [

	| method |
	
	method := self buildDummyMethod: #foo.
	
	messages 
		at: method put: { #= . #+ . #< };
		at: (self buildDummyMethod: #= ) put: { #>= . #<= } .
	
	self
		assert: (messages is: method connectedToAny: { #- . #>= })
]

{ #category : 'tests' }
RTDMessagesTest >> testNoMessageIsConnected [

	| method |
	
	method := self buildDummyMethod: #foo.
	
	messages
		at: method put: { #= . #+ . #< };
		at: (self buildDummyMethod: #= ) put: { #assert: . #plus . #minus };
		at: (self buildDummyMethod: #+) put: { #= . #+ . #foo };
		at: (self buildDummyMethod: #< ) put: {  } .
	
	self
		deny: (messages is: method connectedToAny: { #/ . #- . #>= })
]

{ #category : 'tests' }
RTDMessagesTest >> testRaisesNotFound [

	| method |
	method := self buildDummyMethod: #foo.
	
	self
		should: [ messages at: method ] raise: RTDMethodNotFound;
		should: [ messages is: method connectedTo: #bar ] raise: RTDMethodNotFound;
		should: [ messages does: method includesMessage: #foo ] raise: RTDMethodNotFound;
		should: [ messages does: method includesSubmethod: method ] raise: RTDMethodNotFound
]
