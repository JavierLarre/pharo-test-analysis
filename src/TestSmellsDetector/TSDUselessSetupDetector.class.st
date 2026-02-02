"
I am a detector for test methods that does not use all instance variables set up in a setUp method from the same class
"
Class {
	#name : 'TSDUselessSetupDetector',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'setupSelector',
		'instanceVariablesFinder',
		'selfClass',
		'assignmentsFinder'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'accessing' }
TSDUselessSetupDetector >> assignmentFinder [

	^ assignmentsFinder ifNil: [ assignmentsFinder := TSDAssignInstancesFinder new ]
]

{ #category : 'testing' }
TSDUselessSetupDetector >> doesUseSetUp [

	^ (self setupVariables difference: self foundInstanceVariables) isEmpty
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> foundInstanceVariables [

	^ self instanceVariablesFinder
		  visit: self rootNode;
		  foundVariables 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> instanceVariablesFinder [

	^ instanceVariablesFinder ifNil: [ instanceVariablesFinder := TSDAccessInstancesFinder new ]
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> lookupNode: aSelector [

	^ (self selfClass lookupSelector: aSelector) parseTree
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> rootNode [

	^ self lookupNode: selector
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selector: aSelector [

	selector := aSelector 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selfClass [

	^ selfClass
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> selfClass: aClass [

	selfClass := aClass.
	self assignmentFinder selfClass: aClass.
	self instanceVariablesFinder selfClass: aClass 
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

	^ self assignmentFinder
		  visit: (self lookupNode: self setUpSelector);
		  foundVariables 
]
