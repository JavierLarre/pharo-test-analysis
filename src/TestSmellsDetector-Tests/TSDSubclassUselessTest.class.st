Class {
	#name : 'TSDSubclassUselessTest',
	#superclass : 'TSDUselessSetupDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'asserting' }
TSDSubclassUselessTest class >> shouldInheritSelectors [ 
	
	^ true
]

{ #category : 'accessing' }
TSDSubclassUselessTest >> fixtureClass [ 

	^ TSDSubFixture 
]

{ #category : 'tests' }
TSDSubclassUselessTest >> testAllSetupMustBeUsed [

	self deny: (self doesUseSetUp: #testUsesSomeInstanceVar )
]
