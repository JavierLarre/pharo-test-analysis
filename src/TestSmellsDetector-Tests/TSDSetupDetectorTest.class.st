Class {
	#name : 'TSDSetupDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'detector'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDSetupDetectorTest >> detectorClass [
	^ self subclassResponsibility
]

{ #category : 'helpers' }
TSDSetupDetectorTest >> doesDetect: aSelector [

	^ detector selector: aSelector;
		detects
]

{ #category : 'running' }
TSDSetupDetectorTest >> fixtureClass [

	^ TSDFixture 
]

{ #category : 'running' }
TSDSetupDetectorTest >> setUp [

	super setUp.
	detector := self detectorClass new
		            selfClass: self fixtureClass;
		            yourself
]
