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

	^ accessesFinder ifNil: [ accessesFinder := TSDInstanceVariablesFinder accessings ]
]

{ #category : 'testing' }
TSDUselessSetupDetector >> detects [
	^ self doesUseSetUp 
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

{ #category : 'accessing' }
TSDUselessSetupDetector >> selfClass: aClass [

	super selfClass: aClass .
	self accessesFinder selfClass: aClass 
]
