"
I store helpers that are to be used for analysis in tests
"
Class {
	#name : 'MaVisitorFixture',
	#superclass : 'Object',
	#instVars : [
		'x'
	],
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'as yet unclassified' }
MaVisitorFixture class >> guardedHelper [ 
	
	"I am not a helper nor I am guarded"
	^true
]

{ #category : 'tests' }
MaVisitorFixture class >> testFalseGuarded [
	self guardedHelper 
]

{ #category : 'tests' }
MaVisitorFixture >> bigHelper [
	
	self helper0;
		helper1;
		helper2.
	false ifTrue: [ self guardedHelper ]
]

{ #category : 'accessing' }
MaVisitorFixture >> cycle1 [ 

	self cycle2
]

{ #category : 'accessing' }
MaVisitorFixture >> cycle2 [ 

	self cycle1
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> guardedHelper [
	
	self assert: true
	
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> helper [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> helper0 [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> helper1 [
	
	self assert: false
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> helper2 [
	
	self assert: false;
		assert: true
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> nestedHelper [
	
	self helper.
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> notAHelper [
	
	x value
]

{ #category : 'tests' }
MaVisitorFixture >> testBigHelper [

	self bigHelper
]

{ #category : 'tests' }
MaVisitorFixture >> testBigHelperGuarded [

	true ifTrue: [ self bigHelper ]
]

{ #category : 'tests' }
MaVisitorFixture >> testCycle [

	self cycle1
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> testHelper [
	
	self helper.
	x foo.
	true ifTrue: [ self guardedHelper . ].
	self notAHelper
]

{ #category : 'tests' }
MaVisitorFixture >> testHelperOnArguments [

	self assert: self helper
]

{ #category : 'tests' }
MaVisitorFixture >> testHelperWithVariable [
	
	true ifTrue: [ x helper ].
	self helper
	
]

{ #category : 'as yet unclassified' }
MaVisitorFixture >> testNested [
	
	self nestedHelper.
]

{ #category : 'tests' }
MaVisitorFixture >> testNotHelperIsGuarded [

	false ifFalse: [ self notAHelper ].
	true ifTrue: [ self guardedHelper ].
	self helper.
	self notAHelper 	
]
