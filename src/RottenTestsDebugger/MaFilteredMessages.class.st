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
MaFilteredMessages >> atMethod: aCompiledMethod putMessages: aMessageSet [

	super atMethod: aCompiledMethod putMessages: (aMessageSet difference: bannedMessages )
]

{ #category : 'accessing' }
MaFilteredMessages >> bannedMessages: aMessageSet [

	bannedMessages := aMessageSet 
]
