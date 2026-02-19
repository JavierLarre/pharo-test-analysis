"
I detect whether a test references a classes more than three times
"
Class {
	#name : 'TSDTooManyClassesDetector',
	#superclass : 'TSDDetector',
	#instVars : [
		'visitor'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'testing' }
TSDTooManyClassesDetector >> detects [

	self resetVisitor.
	self referenceVisitor visit: self compiledMethod parseTree.
	^ self referenceVisitor referencesCount >= self ocurrenceThreshold or: [
		  self referenceVisitor anyClassIsReferencedMoreThan: self ocurrenceThreshold ]
]

{ #category : 'accessing' }
TSDTooManyClassesDetector >> ocurrenceThreshold [

	^ 3
]

{ #category : 'accessing' }
TSDTooManyClassesDetector >> referenceVisitor [

	^ visitor ifNil: [ visitor := TSDClassReferencesVisitor new selfClass: self selfClass; yourself ]
]

{ #category : 'private' }
TSDTooManyClassesDetector >> resetVisitor [

	visitor := nil "forces the getter to build a fresh visitor"
]
