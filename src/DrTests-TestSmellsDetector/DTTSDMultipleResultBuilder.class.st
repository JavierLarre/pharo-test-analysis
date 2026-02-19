"
I am a composite of result builders
"
Class {
	#name : 'DTTSDMultipleResultBuilder',
	#superclass : 'DTTSDResultBuilder',
	#instVars : [
		'builders'
	],
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'accessing' }
DTTSDMultipleResultBuilder class >> builders: aCollection [
	
	^ self new builders: aCollection ; yourself
]

{ #category : 'execution' }
DTTSDMultipleResultBuilder >> buildData: aTestData withTests: testCases [

	^ self builders do: [ :aBuilder | aBuilder buildData: aTestData withTests: testCases ]
]

{ #category : 'accessing' }
DTTSDMultipleResultBuilder >> builders [

	^ builders ifNil: [ builders := OrderedCollection new ]
]

{ #category : 'accessing' }
DTTSDMultipleResultBuilder >> builders: anObject [

	builders := anObject
]
