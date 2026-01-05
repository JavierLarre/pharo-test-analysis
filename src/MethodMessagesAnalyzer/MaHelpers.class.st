"
I am a data structure that encapsulates helpers found by the analyzer
"
Class {
	#name : 'MaHelpers',
	#superclass : 'Object',
	#instVars : [
		'helpers'
	],
	#category : 'MethodMessagesAnalyzer',
	#package : 'MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
MaHelpers >> guardedHelpers [
	
	^ { MaHelperFixture >> #guardedHelper }
]

{ #category : 'accessing' }
MaHelpers >> helperIsGuarded: aCompiledMethod [ 
	
	^ true
]

{ #category : 'accessing' }
MaHelpers >> helpers [
	
	^helpers 
]

{ #category : 'accessing' }
MaHelpers >> helpers: aHelperCollection [
	
	helpers := aHelperCollection 
]

{ #category : 'accessing' }
MaHelpers >> helpersOf: aCompiledMethod [
	
	^helpers at: aCompiledMethod parseTree 
]

{ #category : 'accessing' }
MaHelpers >> isHelper: aCompiledHelper in: aCompiledMethod [

	^(helpers at: aCompiledMethod parseTree ) includes: aCompiledHelper 
]
