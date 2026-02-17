"
I detect whether a method overwrites an instance variable set up in a setUp method
"
Class {
	#name : 'TSDOverWrittenSetupDetector',
	#superclass : 'TSDSetupDetector',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'testing' }
TSDOverWrittenSetupDetector >> detects [
	^ self doesOverWritesSetUp 
]

{ #category : 'testing' }
TSDOverWrittenSetupDetector >> doesOverWritesSetUp [

	^ self writtenVariables includesAny: self setupVariables 
]

{ #category : 'api' }
TSDOverWrittenSetupDetector >> writtenVariables [

	^ self assignsFinder at: self selector
]
