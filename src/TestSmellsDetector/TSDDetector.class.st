"
I am an interface for detectors in this package
"
Class {
	#name : 'TSDDetector',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'selfClass'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDDetector class >> isAbstract [ 
	
	^ self = TSDDetector 
]

{ #category : 'accessing' }
TSDDetector >> compiledMethod [

	^ self lookupMethod: self selector
]

{ #category : 'api' }
TSDDetector >> detect: aSelector from: aClass [

	^ self 
		selector: aSelector;
		selfClass: aClass;
		detects
]

{ #category : 'testing' }
TSDDetector >> detects [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
TSDDetector >> lookupMethod: aSelector [

	^ self selfClass lookupSelector: aSelector 
]

{ #category : 'accessing' }
TSDDetector >> selector [

	^ selector
]

{ #category : 'accessing' }
TSDDetector >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
TSDDetector >> selfClass [

	^ selfClass
]

{ #category : 'accessing' }
TSDDetector >> selfClass: anObject [

	selfClass := anObject
]
