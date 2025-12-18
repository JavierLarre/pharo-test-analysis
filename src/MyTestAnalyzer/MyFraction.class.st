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

{ #category : 'comparing' }
MyFraction >> = anObject [
	^super = anObject 
	and: [ (self enum = anObject enum) & (self denom = anObject denom) ]
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
	^ aFloat sumWithFloat: self asMyFloat 
]

{ #category : 'as yet unclassified' }
MyFraction >> sumWithFraction: aFraction [
	^self class 
		enum: (enum * aFraction denom) + (aFraction enum * denom) 
		denom: denom * aFraction denom 
]

{ #category : 'adding' }
MyFraction >> sumWithInteger: anInteger [
	^ self class enum: enum + (anInteger number * denom) denom: denom
]
