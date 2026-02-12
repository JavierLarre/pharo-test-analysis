Extension { #name : 'TestCase' }

{ #category : '*DrTests-RottenTestsDebugger' }
TestCase >> compiledMethod [

	^ self class lookupSelector: self selector 
]
