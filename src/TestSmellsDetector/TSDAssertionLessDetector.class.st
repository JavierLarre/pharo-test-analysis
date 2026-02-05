"
I detect whether tests do not contain assertions
"
Class {
	#name : 'TSDAssertionLessDetector',
	#superclass : 'Object',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDAssertionLessDetector >> isAssertionLess: aCompiledMethod [ 
	^ true
]
