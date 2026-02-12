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

	^ detector ifNil: [ detector := self detectorClass new
		            selfClass: self fixtureClass;
		            yourself ]
]

{ #category : 'accessing' }
TSDDetectorTest >> detectorClass [
	^ self subclassResponsibility
]

{ #category : 'helpers' }
TSDDetectorTest >> doesDetect: aSelector [

	^ self detector selector: aSelector;
		detects
]

{ #category : 'running' }
TSDDetectorTest >> fixtureClass [

	^ TSDFakeTests 
]
