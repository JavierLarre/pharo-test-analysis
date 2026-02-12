Class {
	#name : 'DTTSDOverwrittenSetupBuilder',
	#superclass : 'DTTSDDetectorBuilder',
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'execution' }
DTTSDOverwrittenSetupBuilder >> buildResult: aResult withTests: testCases [

	^ aResult overwrittenSetupTests: (self detectedTestCases: testCases )
]

{ #category : 'factory' }
DTTSDOverwrittenSetupBuilder >> newDetector [

	^ TSDOverWrittenSetupDetector new
]
