"
I am an abstract result builder for detectors
"
Class {
	#name : 'DTTSDDetectorBuilder',
	#superclass : 'DTTSDResultBuilder',
	#instVars : [
		'detector',
		'resultTestsSelector'
	],
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> assertionless [

	^ self 
		detector: (TSDAssertionLessDetector new
		  		methodVisitor: RTDHelperVisitor withAssertableSelectors;
		  		yourself)
		resultTestsSelector: #assertionlessTests:
]

{ #category : 'visiting' }
DTTSDDetectorBuilder class >> classReferences [ 

	^ self detector: TSDTooManyClassesDetector new resultTestsSelector: #manyClassReferencesTests: 
]

{ #category : 'instance creation' }
DTTSDDetectorBuilder class >> detector: aDetector resultTestsSelector: aSelector [

	^ self new
		detector: aDetector;
		resultTestsSelector: aSelector;
		yourself
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> overwrittenSetup [ 

	^ self detector: TSDOverWrittenSetupDetector new resultTestsSelector: #overwrittenSetupTests:
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> uselessSetup [

	^ self detector: TSDUselessSetupDetector new resultTestsSelector: #uselessSetupTests:
]

{ #category : 'execution' }
DTTSDDetectorBuilder >> buildResult: aResult withTests: testCases [

	^ aResult perform: self resultTestsSelector with: (self detectedTestCases: testCases)
]

{ #category : 'enumerating' }
DTTSDDetectorBuilder >> detectedTestCases: testCases [

	^ testCases select: [ :aTestCase | self detector detect: aTestCase selector from: aTestCase class ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> detector [

	^ detector ifNil: [ Error signal: 'Detector not set' ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> detector: anObject [

	detector := anObject
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> resultTestsSelector [

	^ resultTestsSelector ifNil: [ Error signal: 'Selector not set' ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> resultTestsSelector: anObject [

	resultTestsSelector := anObject
]
