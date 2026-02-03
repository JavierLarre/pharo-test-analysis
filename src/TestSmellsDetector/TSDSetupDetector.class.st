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

{ #category : 'as yet unclassified' }
TSDSetupDetector >> detects [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
TSDSetupDetector >> lookupNode: aSelector [

	^ (self selfClass lookupSelector: aSelector) parseTree
]

{ #category : 'as yet unclassified' }
TSDSetupDetector >> selector: aSelector [ 
	
	selector := aSelector 
]
