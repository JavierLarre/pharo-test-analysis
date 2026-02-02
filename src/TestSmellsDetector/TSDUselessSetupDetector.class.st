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

	^ assignmentsFinder ifNil: [ assignmentsFinder := TSDAssignmentsFinder new ]
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> considerClassesThat: aBlock [

	self instanceVariablesFinder considerClassesThat: aBlock.
	self assignmentFinder considerClassesThat: aBlock 
]

{ #category : 'testing' }
TSDUselessSetupDetector >> doesUseSetUp [

	^ (self setupVariables difference: self foundInstanceVariables) isEmpty
]

{ #category : 'as yet unclassified' }
TSDUselessSetupDetector >> foundInstanceVariables [

	^ self instanceVariablesFinder
		  visit: self rootNode;
		  foundVariables 
]

{ #category : 'accessing' }
TSDUselessSetupDetector >> instanceVariablesFinder [

	^ instanceVariablesFinder ifNil: [ instanceVariablesFinder := TSDInstanceVariablesFinder new ]
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

{ #category : 'as yet unclassified' }
TSDUselessSetupDetector >> setupVariables [

	^ self assignmentFinder
		  visit: (self lookupNode: self setUpSelector);
		  foundVariables 
]
