"
I store helpers that are to be used for analysis in tests
"
Class {
	#name : 'RTDVisitorFixture',
	#superclass : 'Object',
	#instVars : [
		'x'
	],
	#category : 'RottenTestsDebugger-Tests',
	#package : 'RottenTestsDebugger-Tests'
}

{ #category : 'as yet unclassified' }
RTDVisitorFixture class >> guardedHelper [ 
	
	"I am not a helper nor I am guarded"
	^true
]

{ #category : 'tests' }
RTDVisitorFixture class >> testFalseGuarded [
	self guardedHelper 
]

{ #category : 'tests' }
RTDVisitorFixture >> bigHelper [
	
	self helper0;
		helper1;
		helper2.
	false ifTrue: [ self guardedHelper ]
]

{ #category : 'accessing' }
RTDVisitorFixture >> cycle1 [ 

	self cycle2
]

{ #category : 'accessing' }
RTDVisitorFixture >> cycle2 [ 

	self cycle1
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> guardedHelper [
	
	self assert: true
	
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> helper [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> helper0 [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> helper1 [
	
	self assert: false
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> helper2 [
	
	self assert: false;
		assert: true
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> nestedHelper [
	
	self helper.
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> notAHelper [
	
	x value
]

{ #category : 'tests' }
RTDVisitorFixture >> testBigHelper [

	self bigHelper
]

{ #category : 'tests' }
RTDVisitorFixture >> testBigHelperGuarded [

	true ifTrue: [ self bigHelper ]
]

{ #category : 'tests' }
RTDVisitorFixture >> testCycle [

	self cycle1
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> testHelper [
	
	self helper.
	x foo.
	true ifTrue: [ self guardedHelper . ].
	self notAHelper
]

{ #category : 'tests' }
RTDVisitorFixture >> testHelperOnArguments [

	self assert: self helper
]

{ #category : 'tests' }
RTDVisitorFixture >> testHelperWithVariable [
	
	true ifTrue: [ x helper ].
	self helper
	
]

{ #category : 'as yet unclassified' }
RTDVisitorFixture >> testNested [
	
	self nestedHelper.
]

{ #category : 'tests' }
RTDVisitorFixture >> testNotHelperIsGuarded [

	false ifFalse: [ self notAHelper ].
	true ifTrue: [ self guardedHelper ].
	self helper.
	self notAHelper 	
]
