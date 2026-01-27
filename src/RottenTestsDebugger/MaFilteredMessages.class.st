"
I filter the incoming messages from a given set of messages
"
Class {
	#name : 'MaFilteredMessages',
	#superclass : 'RTDMessages',
	#instVars : [
		'bannedMessages'
	],
	#category : 'RottenTestsDebugger',
	#package : 'RottenTestsDebugger'
}

{ #category : 'accessing' }
MaFilteredMessages >> at: aCompiledMethod put: aMessageSet [

	super at: aCompiledMethod put: (aMessageSet difference: bannedMessages )
]

{ #category : 'accessing' }
MaFilteredMessages >> bannedMessages [

	^ bannedMessages 
]

{ #category : 'accessing' }
MaFilteredMessages >> bannedMessages: aMessageSet [

	bannedMessages := aMessageSet 
]
