"
A TSDTooManyClassesDetectorTest is a test class for testing the behavior of TSDTooManyClassesDetector
"
Class {
	#name : 'TSDTooManyClassesDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDTooManyClassesDetectorTest >> detectorClass [ 

	^ TSDTooManyClassesDetector 
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetects [

	self assert: (self doesDetect: #testUsesTooManyClasses )
]
