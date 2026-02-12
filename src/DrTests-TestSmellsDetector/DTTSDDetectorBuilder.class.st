Class {
	#name : 'DTTSDDetectorBuilder',
	#superclass : 'DTTSDResultBuilder',
	#instVars : [
		'detector'
	],
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'testing' }
DTTSDDetectorBuilder class >> isAbstract [

	^ self == DTTSDDetectorBuilder
]

{ #category : 'enumerating' }
DTTSDDetectorBuilder >> detectedTestCases: testCases [

	^ testCases select: [ :aTestCase | self detector detect: aTestCase selector from: aTestCase class ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> detector [

	^ detector ifNil: [ detector := self newDetector ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> detector: anObject [

	detector := anObject
]

{ #category : 'factory' }
DTTSDDetectorBuilder >> newDetector [

	^ self subclassResponsibility 
]
