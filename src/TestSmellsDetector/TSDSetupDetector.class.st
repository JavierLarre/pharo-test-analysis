"
I provide information about variables assigned in a setUp method
"
Class {
	#name : 'TSDSetupDetector',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'selfClass',
		'setupSelector',
		'assignsFinder'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'accessing' }
TSDSetupDetector >> assignsFinder [

	^ assignsFinder ifNil: [ assignsFinder := TSDInstanceVariablesFinder assignments ]
]

{ #category : 'testing' }
TSDSetupDetector >> detects [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
TSDSetupDetector >> lookupNode: aSelector [

	^ (self selfClass lookupSelector: aSelector) parseTree
]

{ #category : 'accessing' }
TSDSetupDetector >> rootNode [

	^ self lookupNode: selector
]

{ #category : 'accessing' }
TSDSetupDetector >> selector: aSelector [ 
	
	selector := aSelector 
]

{ #category : 'accessing' }
TSDSetupDetector >> selfClass [

	^ selfClass
]

{ #category : 'accessing' }
TSDSetupDetector >> selfClass: aClass [ 

	selfClass := aClass.
	self assignsFinder selfClass: aClass 
]

{ #category : 'initialization' }
TSDSetupDetector >> setUpSelector [

	^ setupSelector ifNil: [ setupSelector := #setUp ]
]

{ #category : 'initialization' }
TSDSetupDetector >> setUpSelector: aSelector [

	^ setupSelector := aSelector 
]

{ #category : 'accessing' }
TSDSetupDetector >> setupVariables [

	^ self 
		variables: self setUpSelector 
		from: self assignsFinder
]

{ #category : 'private' }
TSDSetupDetector >> variables: aSelector from: aFinder [

	^ aFinder
		  visit: (self lookupNode: aSelector);
		  foundVariables 
]
