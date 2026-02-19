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
TSDDetector class >> selfClass: aClass [

	^ self new selfClass: aClass; yourself
]

{ #category : 'accessing' }
TSDDetector >> compiledMethod [

	^ self lookupMethod: self selector
]

{ #category : 'api' }
TSDDetector >> detect: aSelector from: aClass [

	^ self 
		selfClass: aClass;
		detectSelector: aSelector 
]

{ #category : 'api' }
TSDDetector >> detectSelector: aSelector [
	
	"assumes the self class was already given"
	^ self selector: aSelector; detects
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
