Class {
	#name : 'MyFloat',
	#superclass : 'MyNumber',
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'arithmetic' }
MyFloat >> + aNumber [
	^ aNumber sumWithFloat: self
]

{ #category : 'adding' }
MyFloat >> sumWithFloat: aFloat [
	^ self class fromNumber: (number + aFloat number)
]

{ #category : 'as yet unclassified' }
MyFloat >> sumWithFraction: aFraction [
	^MyFloat fromNumber: (number + aFraction asFloat)
]

{ #category : 'adding' }
MyFloat >> sumWithInteger: anInteger [
	^ self class fromNumber: (number + anInteger number)
]
