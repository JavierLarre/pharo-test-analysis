"
I am a detector for test methods that does not use all instance variables set up in a setUp method from the same class
"
Class {
	#name : 'TSDUselessSetupDetector',
	#superclass : 'TSDSetupDetector',
	#instVars : [
		'accessesFinder'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'accessing' }
TSDUselessSetupDetector >> accessesFinder [

	^ accessesFinder ifNil: [ accessesFinder := TSDInstanceVariablesFinder accessings
			selfClass: self selfClass; yourself ]
]

{ #category : 'testing' }
TSDUselessSetupDetector >> detects [

	accessesFinder := nil.
	^ self doesUseSetUp not
]

{ #category : 'testing' }
TSDUselessSetupDetector >> doesUseSetUp [

	^ (self setupVariables difference: self foundInstanceVariables) isEmpty
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> foundInstanceVariables [

	^ self 
		variables: self selector 
		with: self accessesFinder 
]
