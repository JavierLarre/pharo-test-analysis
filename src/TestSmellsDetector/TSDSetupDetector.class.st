"
I provide information about variables assigned in a setUp method
"
Class {
	#name : 'TSDSetupDetector',
	#superclass : 'TSDDetector',
	#instVars : [
		'setupSelector',
		'assignsFinder'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDSetupDetector class >> isAbstract [ 

	^ self = TSDSetupDetector 
]

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

	^ (self lookupMethod: aSelector) parseTree
]

{ #category : 'accessing' }
TSDSetupDetector >> selfClass: aClass [ 

	super selfClass: aClass .
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
		with: self assignsFinder
]

{ #category : 'private' }
TSDSetupDetector >> variables: aSelector with: aFinder [

	^ aFinder
		  visit: (self lookupNode: aSelector);
		  foundVariables 
]
