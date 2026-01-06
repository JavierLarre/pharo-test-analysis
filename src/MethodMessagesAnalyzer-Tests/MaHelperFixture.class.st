"
I store helpers that are to be used for analysis in tests
"
Class {
	#name : 'MaHelperFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'as yet unclassified' }
MaHelperFixture class >> guardedHelper [ 
	
	"I am not a helper nor I am guarded"
	^true
]

{ #category : 'tests' }
MaHelperFixture class >> testFalseGuarded [
	self guardedHelper 
]

{ #category : 'tests' }
MaHelperFixture >> bigHelper [
	
	self helper0;
		helper1;
		helper2;
		guardedHelper
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> guardedHelper [
	
	self assert: true
	
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> helper [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> helper0 [
	
	self assert: true
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> helper1 [
	
	self assert: false
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> helper2 [
	
	self assert: false;
		assert: true
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> notAHelper [
	^true
]

{ #category : 'tests' }
MaHelperFixture >> testBigHelper [

	self bigHelper
]

{ #category : 'tests' }
MaHelperFixture >> testBigHelperGuarded [

	true ifTrue: [ self bigHelper ]
]

{ #category : 'as yet unclassified' }
MaHelperFixture >> testHelper [
	
	self helper.
	true ifTrue: [ self guardedHelper . ].
	self notAHelper
]

{ #category : 'tests' }
MaHelperFixture >> testNotHelperIsGuarded [

	false ifFalse: [ self notAHelper ].
	true ifTrue: [ self guardedHelper ].
	self helper.
	self notAHelper 	
]
