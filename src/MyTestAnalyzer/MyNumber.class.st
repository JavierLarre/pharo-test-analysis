Class {
	#name : 'MyNumber',
	#superclass : 'Object',
	#instVars : [
		'number'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'converting' }
MyNumber class >> fromNumber: aNumber [
	^ self new number: aNumber;
	yourself 
]

{ #category : 'arithmetic' }
MyNumber >> + aNumber [
	^ self subclassResponsibility 
]

{ #category : 'accessing' }
MyNumber >> number [
	^number 
]

{ #category : 'accessing' }
MyNumber >> number: aNumber [
	number := aNumber 
]

{ #category : 'adding' }
MyNumber >> sumWithFloat: aFloat [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
MyNumber >> sumWithFraction: aFraction [
	^self subclassResponsibility 
]

{ #category : 'adding' }
MyNumber >> sumWithInteger: anInteger [
	^ self subclassResponsibility 
]
