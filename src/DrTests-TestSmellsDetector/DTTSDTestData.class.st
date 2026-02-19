"
I store the detected smells resulting from the plugin
"
Class {
	#name : 'DTTSDTestData',
	#superclass : 'Object',
	#instVars : [
		'assertionlessTests',
		'overwrittenSetupTests',
		'manyClassReferencesTests',
		'uselessSetupTests'
	],
	#category : 'DrTests-TestSmellsDetector-Presenters',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDTestData >> assertionlessTests [

	^ assertionlessTests
]

{ #category : 'accessing' }
DTTSDTestData >> assertionlessTests: anObject [

	assertionlessTests := anObject
]

{ #category : 'accessing' }
DTTSDTestData >> manyClassReferencesTests [

	^ manyClassReferencesTests
]

{ #category : 'accessing' }
DTTSDTestData >> manyClassReferencesTests: anObject [

	manyClassReferencesTests := anObject
]

{ #category : 'accessing' }
DTTSDTestData >> overwrittenSetupTests [

	^ overwrittenSetupTests
]

{ #category : 'accessing' }
DTTSDTestData >> overwrittenSetupTests: anObject [

	overwrittenSetupTests := anObject
]

{ #category : 'accessing' }
DTTSDTestData >> uselessSetupTests [

	^ uselessSetupTests
]

{ #category : 'accessing' }
DTTSDTestData >> uselessSetupTests: anObject [

	uselessSetupTests := anObject
]
