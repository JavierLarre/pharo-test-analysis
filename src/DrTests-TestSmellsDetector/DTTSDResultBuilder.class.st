"
I define the interface for building a result with a test collection
"
Class {
	#name : 'DTTSDResultBuilder',
	#superclass : 'Object',
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'testing' }
DTTSDResultBuilder class >> isAbstract [ 

	^ self = DTTSDResultBuilder 
]

{ #category : 'execution' }
DTTSDResultBuilder >> buildResult: aResult withTests: testCases [

	^ self subclassResponsibility 
]
