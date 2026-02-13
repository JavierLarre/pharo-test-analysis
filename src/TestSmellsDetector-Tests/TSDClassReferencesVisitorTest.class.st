"
A TSDTooManyClassesDetectorTest is a test class for testing the behavior of TSDTooManyClassesDetector
"
Class {
	#name : 'TSDClassReferencesVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor'
	],
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDClassReferencesVisitorTest >> fixtureClass [

	^ TSDFakeTests
]

{ #category : 'tests' }
TSDClassReferencesVisitorTest >> testDenyDetect [

	self visit: #testConnectedToAssertion.
	self
		assertEmpty: self visitor classReferences;
		assert: self visitor referencesCount equals: 0
]

{ #category : 'tests' }
TSDClassReferencesVisitorTest >> testDetectsClasses [

	self visit: #testUsesClasses.
	self
		assertCollection: self visitor classReferences hasSameElements: { TSDClassReferencesVisitor } ;
		assert: self visitor referencesCount equals: 1
]

{ #category : 'tests' }
TSDClassReferencesVisitorTest >> testReferencesOf [

	self 
		visit: #testUsesTheSameClass;
		assert: (self visitor referencesOf: self fixtureClass ) equals: 4
]

{ #category : 'visiting' }
TSDClassReferencesVisitorTest >> visit: aSelector [
	
	^ self visitor visit: (self fixtureClass >> aSelector ) parseTree
]

{ #category : 'accessing' }
TSDClassReferencesVisitorTest >> visitor [ 

	^ visitor ifNil: [ visitor := TSDClassReferencesVisitor new
			selfClass: self fixtureClass; yourself ]
]
