Class {
	#name : 'MyFraction',
	#superclass : 'MyNumber',
	#instVars : [
		'enum',
		'denom'
	],
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'as yet unclassified' }
MyFraction class >> enum: anEnum denom: aDenom [
	^ self new enum: anEnum ;
		denom: aDenom ;
		yourself 
]

{ #category : 'arithmetic' }
MyFraction >> + aNumber [
	^ aNumber sumWithFraction: self
]

{ #category : 'converting' }
MyFraction >> asMyFloat [ 
	^ MyFloat fromNumber: (enum / denom) 
]

{ #category : 'accessing' }
MyFraction >> denom [
	^denom 
]

{ #category : 'accessing' }
MyFraction >> denom: anInteger [
	denom := anInteger 
]

{ #category : 'accessing' }
MyFraction >> enum [
	^enum 
]

{ #category : 'accessing' }
MyFraction >> enum: anInteger [
	enum := anInteger 
]

{ #category : 'adding' }
MyFraction >> sumWithFloat: aFloat [
	^ MyFloat fromNumber: (aFloat number + self asFloat )
]

{ #category : 'as yet unclassified' }
MyFraction >> sumWithFraction: aFraction [
	^Fraction 
		enum: (enum * aFraction denom) + (aFraction enum * denom) 
		denom: denom * aFraction denom 
]

{ #category : 'adding' }
MyFraction >> sumWithInteger: anInteger [
	^ MyFraction enum: enum + (anInteger number * denom) denom: denom
]
