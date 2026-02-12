Class {
	#name : 'DTTSDAssertionlessBuilder',
	#superclass : 'DTTSDDetectorBuilder',
	#category : 'DrTests-TestSmellsDetector-Builders',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Builders'
}

{ #category : 'execution' }
DTTSDAssertionlessBuilder >> buildResult: aResult withTests: testCases [

	^ aResult assertionlessTests: (self detectedTestCases: testCases )
]

{ #category : 'factory' }
DTTSDAssertionlessBuilder >> newDetector [

	^ TSDAssertionLessDetector new
		  methodVisitor: RTDHelperVisitor withAssertableSelectors;
		  yourself
]
