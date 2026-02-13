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

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetectsThenDenies [

	self 
		assert: (self doesDetect: #testUsesTooManyClasses);
		deny: (self doesDetect: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetectsUsesOfTheSameClass [

	self assert: (self doesDetect: #testUsesTheSameClass)
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testRemembersDetect [

	self
		assert: (self doesDetect: #testUsesTooManyClasses);
		deny: (self doesDetect: #testConnectedToAssertion);
		assert: (self doesDetect: #testUsesTooManyClasses)
]
