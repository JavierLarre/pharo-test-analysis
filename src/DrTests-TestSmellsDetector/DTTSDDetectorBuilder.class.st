"
I am an abstract result builder for detectors
"
Class {
	#name : 'DTTSDDetectorBuilder',
	#superclass : 'DTTSDResultBuilder',
	#instVars : [
		'detector',
		'resultTestsSelector',
		'setDataBlock'
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
		setDataBlock: [ :aTestData :tests | aTestData assertionlessTests: tests ]
]

{ #category : 'visiting' }
DTTSDDetectorBuilder class >> classReferences [ 

	^ self 
		detector: TSDTooManyClassesDetector new 
		setDataBlock: [ :aTestData :tests | aTestData manyClassReferencesTests: tests ] 
]

{ #category : 'instance creation' }
DTTSDDetectorBuilder class >> detector: aDetector resultTestsSelector: aSelector [

	^ self new
		detector: aDetector;
		resultTestsSelector: aSelector;
		yourself
]

{ #category : 'instance creation' }
DTTSDDetectorBuilder class >> detector: aDetector setDataBlock: aBlock [

	^ self new
		detector: aDetector;
		setDataBlock: aBlock;
		yourself
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> overwrittenSetup [ 

	^ self 
		detector: TSDOverWrittenSetupDetector new 
		setDataBlock: [ :aTestData :tests | aTestData overwrittenSetupTests: tests ]
]

{ #category : 'accessing' }
DTTSDDetectorBuilder class >> uselessSetup [

	^ self 
		detector: TSDUselessSetupDetector new 
		setDataBlock: [ :aTestData :tests | aTestData uselessSetupTests: tests ]
]

{ #category : 'execution' }
DTTSDDetectorBuilder >> buildData: aTestData withTests: testCases [

	^ self setDataBlock value: aTestData value: (self detectedTestCases: testCases )
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

{ #category : 'accessing' }
DTTSDDetectorBuilder >> setDataBlock [

	^ setDataBlock
]

{ #category : 'accessing' }
DTTSDDetectorBuilder >> setDataBlock: anObject [

	setDataBlock := anObject
]
