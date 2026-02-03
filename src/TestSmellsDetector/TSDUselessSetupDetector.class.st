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

{ #category : 'accessing' }
TSDUselessSetupDetector >> assignsFinder [

	^ assignsFinder ifNil: [ assignsFinder := TSDInstanceVariablesFinder assignments ]
]

{ #category : 'accessing' }
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
		variables: selector 
		from: self accessesFinder 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> rootNode [

	^ self lookupNode: selector
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selfClass [

	^ selfClass
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selfClass: aClass [

	selfClass := aClass.
	self assignsFinder selfClass: aClass.
	self accessesFinder selfClass: aClass 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> setUpSelector [

	^ setupSelector ifNil: [ setupSelector := #setUp ]
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> setupSelector: aSelector [

	^ setupSelector := aSelector
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> setupVariables [

	^ self 
		variables: self setUpSelector 
		from: self assignsFinder
]

{ #category : 'private' }
TSDUselessSetupDetector >> variables: aSelector from: aFinder [

	^ aFinder
		  visit: (self lookupNode: aSelector);
		  foundVariables 
]
