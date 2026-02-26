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

{ #category : 'accessing' }
TSDOverwrittenSetupDetector >> asDrTestResult [ 

	| node |
	node := super asDrTestResult.
	node subResults addAll: { 
		DTTreeNode new 
			name: 'Written Variables'; 
			subResults: (DTRTDMessageNode toNodes: self writtenVariables );
			yourself .
		DTTreeNode new 
			name: 'Overwritten Variables';
			subResults: (DTRTDMessageNode toNodes: (self writtenVariables intersection: self setupVariables));
			yourself }. 
	^ node
]

{ #category : 'api' }
TSDOverwrittenSetupDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult overwrittenVariables: (self writtenVariables intersection: self setupVariables )
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
