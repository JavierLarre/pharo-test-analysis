"
I should find messages that are related
"
Class {
	#name : 'MethodMessagesAnalyzer',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'messages',
		'methods',
		'bannedMessages',
		'helperMessages',
		'helperMethods',
		'selfCallsFinder'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'evaluating' }
MethodMessagesAnalyzer >> analyzeMethod: aCompiledMethod [

	| selfCalls |
	aCompiledMethod parseTree acceptVisitor: self.
	selfCalls := selfCallsFinder selfCalls: aCompiledMethod.
	selfCalls select: [ :each | (methods keys includes: each parseTree) not ] thenDo: [ :each | self analyzeMethod: each].
	helperMethods := selfCalls select: [ :each | self result method: each isConnectedToMessage: #assert: ]
		
]

{ #category : 'initialization' }
MethodMessagesAnalyzer >> initialize [ 
	super initialize. 
	messages := Set new.
	methods := Dictionary new.
	helperMessages := { #assert: } asSet.
	helperMethods := Set new.
	bannedMessages := { #assert: } asSet.
	selfCallsFinder := MaSelfCallsFinder new 
		interpreter: (RTFSelfCallInterpreter new 
			considerClassesThat: [:class | class inheritsFrom: TestCase]; 
			yourself);
		yourself 
]

{ #category : 'helpers' }
MethodMessagesAnalyzer >> result [
	^MethodMessagesAnalysisResult 
		analyzedMethods: methods copy
		helperMethods: helperMethods copy 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMessageNode: aMessageNode [
	
	messages add: aMessageNode selector.
	super visitMessageNode: aMessageNode 
]

{ #category : 'visiting' }
MethodMessagesAnalyzer >> visitMethodNode: aMethodNode [
	
	messages := Set new.
	super visitMethodNode: aMethodNode.
	methods at: aMethodNode put: messages
]
