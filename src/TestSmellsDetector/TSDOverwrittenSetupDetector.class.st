"
I detect whether a method overwrites an instance variable set up in a setUp method
"
Class {
	#name : 'TSDOverwrittenSetupDetector',
	#superclass : 'TSDSetupDetector',
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'visiting' }
TSDOverwrittenSetupDetector >> analyzeTestCase: aTestCase [

	self detect: aTestCase selector from: aTestCase class.
	^ TSDResult new 
		selector: self selector;
		testClass: self selfClass;
		overwrittenVariables: (self writtenVariables intersection: self setupVariables);
		yourself
]

{ #category : 'testing' }
TSDOverwrittenSetupDetector >> detects [
	^ self doesOverWritesSetUp 
]

{ #category : 'testing' }
TSDOverwrittenSetupDetector >> doesOverWritesSetUp [

	^ self writtenVariables includesAny: self setupVariables 
]

{ #category : 'api' }
TSDOverwrittenSetupDetector >> writtenVariables [

	^ self assignsFinder at: self selector
]
