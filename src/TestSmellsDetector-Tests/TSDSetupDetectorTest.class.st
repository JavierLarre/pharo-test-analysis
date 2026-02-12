Class {
	#name : 'TSDSetupDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'detector'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'testing' }
TSDSetupDetectorTest class >> isAbstract [ 

	^ self = TSDSetupDetectorTest 
]

{ #category : 'accessing' }
TSDSetupDetectorTest >> detector [ 

	^ detector ifNil: [ detector := self detectorClass new
		            selfClass: self fixtureClass;
		            yourself ]
]

{ #category : 'accessing' }
TSDSetupDetectorTest >> detectorClass [
	^ self subclassResponsibility
]

{ #category : 'helpers' }
TSDSetupDetectorTest >> doesDetect: aSelector [

	^ self detector selector: aSelector;
		detects
]

{ #category : 'running' }
TSDSetupDetectorTest >> fixtureClass [

	^ TSDFakeTests 
]
