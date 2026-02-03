Class {
	#name : 'TSDOverWrittenSetupDetector',
	#superclass : 'TSDSetupDetector',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'accessing' }
TSDOverWrittenSetupDetector >> assignsFinder [

	^ assignsFinder ifNil: [ assignsFinder := TSDInstanceVariablesFinder assignments ]
]

{ #category : 'accessing' }
TSDOverWrittenSetupDetector >> detects [
	^ self doesOverWritesSetUp 
]

{ #category : 'testing' }
TSDOverWrittenSetupDetector >> doesOverWritesSetUp [

	^ self writtenVariables includesAny: self setupVariables 
]

{ #category : 'accessing' }
TSDOverWrittenSetupDetector >> selfClass [

	^ selfClass
]

{ #category : 'accessing' }
TSDOverWrittenSetupDetector >> selfClass: aClass [ 

	selfClass := aClass.
	self assignsFinder selfClass: aClass 
]

{ #category : 'initialization' }
TSDOverWrittenSetupDetector >> setUpSelector [

	^ setupSelector ifNil: [ setupSelector := #setUp ]
]

{ #category : 'accessing' }
TSDOverWrittenSetupDetector >> setupVariables [

	^ self 
		variables: self setUpSelector 
		from: self assignsFinder
]

{ #category : 'private' }
TSDOverWrittenSetupDetector >> variables: aSelector from: aFinder [

	^ aFinder
		  visit: (self lookupNode: aSelector);
		  foundVariables 
]

{ #category : 'accessing' }
TSDOverWrittenSetupDetector >> writtenVariables [
	^ { #x } asSet
]
