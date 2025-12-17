Class {
	#name : 'PrimitiveOperations',
	#superclass : 'Object',
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'converting' }
PrimitiveOperations class >> asFloat: anInteger [ 
	^ anInteger asFloat 
]

{ #category : 'adding' }
PrimitiveOperations class >> floatAdd: aFloat with: anotherFloat [
	^ aFloat + anotherFloat 
]

{ #category : 'adding' }
PrimitiveOperations class >> intAdd: anInteger with: anotherInteger [
	^ anInteger + anotherInteger 
]
