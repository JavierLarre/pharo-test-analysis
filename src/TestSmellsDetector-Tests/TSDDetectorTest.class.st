Class {
	#name : 'TSDDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'detector'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'testing' }
TSDDetectorTest class >> isAbstract [ 

	^ self = TSDDetectorTest 
]

{ #category : 'accessing' }
TSDDetectorTest >> detector [ 

	^ detector ifNil: [ detector := self detectorClass selfClass: self fixtureClass ]
]

{ #category : 'accessing' }
TSDDetectorTest >> detectorClass [
	^ self subclassResponsibility
]

{ #category : 'running' }
TSDDetectorTest >> fixtureClass [

	^ TSDFakeTests 
]
