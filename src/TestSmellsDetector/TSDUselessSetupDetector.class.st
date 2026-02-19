"
I am a detector for test methods that does not use all instance variables set up in a setUp method from the same class
"
Class {
	#name : 'TSDUselessSetupDetector',
	#superclass : 'TSDSetupDetector',
	#instVars : [
		'accessesFinder'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'accessing' }
TSDUselessSetupDetector >> accessesFinder [

	^ accessesFinder ifNil: [ accessesFinder := TSDInstanceVariablesFinder accessings
			selfClass: self selfClass; yourself ]
]

{ #category : 'testing' }
TSDUselessSetupDetector >> detects [

	self accessesFinder reset.
	^ self doesUseSetUp not
]

{ #category : 'testing' }
TSDUselessSetupDetector >> doesUseSetUp [

	^ (self setupVariables difference: self foundInstanceVariables) isEmpty
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> foundInstanceVariables [

	^ self accessesFinder at: self selector
]
