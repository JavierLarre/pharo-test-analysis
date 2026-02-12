"
I detect whether a test references a classes more than three times
"
Class {
	#name : 'TSDTooManyClassesDetector',
	#superclass : 'TSDDetector',
	#instVars : [
		'referenceVisitor'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDTooManyClassesDetector >> detects [

	self referenceVisitor visit: self compiledMethod parseTree.
	^ self referenceVisitor referencesCount >= 3
]

{ #category : 'accessing' }
TSDTooManyClassesDetector >> referenceVisitor [

	^ referenceVisitor ifNil: [ referenceVisitor := TSDClassReferencesVisitor new ]
]
