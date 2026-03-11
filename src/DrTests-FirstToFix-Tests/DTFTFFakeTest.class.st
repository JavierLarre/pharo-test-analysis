"
I am a fake test class for storing methods used as test data
"
Class {
	#name : 'DTFTFFakeTest',
	#superclass : 'TestCase',
	#instVars : [
		'x'
	],
	#category : 'DrTests-FirstToFix-Tests-fixture',
	#package : 'DrTests-FirstToFix-Tests',
	#tag : 'fixture'
}

{ #category : 'running' }
DTFTFFakeTest >> setUp [
	super setUp.
	self skip
]

{ #category : 'tests' }
DTFTFFakeTest >> testFirst [

	x x
]

{ #category : 'tests' }
DTFTFFakeTest >> testSecond [

	x x y
]

{ #category : 'tests' }
DTFTFFakeTest >> testThird [

	x x y z
]
