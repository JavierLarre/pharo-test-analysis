Class {
	#name : 'MyInteger',
	#superclass : 'MyNumber',
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'arithmetic' }
MyInteger >> + aNumber [
	^ aNumber sumWithInteger: self
	
]

{ #category : 'adding' }
MyInteger >> sumWithFloat: aFloat [
	^ MyFloat fromNumber: (number + aFloat number)
]

{ #category : 'as yet unclassified' }
MyInteger >> sumWithFraction: aFraction [
	^MyFraction enum: (number * aFraction denom ) + aFraction enum denom: aFraction denom 
]

{ #category : 'adding' }
MyInteger >> sumWithInteger: anInteger [
	^ self class fromNumber: (number + anInteger number)  
]
