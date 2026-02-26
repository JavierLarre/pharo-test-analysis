"
I am a DTO that contains the result of a detection. Subclasses specify fields for each smell
"
Class {
	#name : 'TSDSmellResult',
	#superclass : 'Object',
	#instVars : [
		'testClass',
		'selector',
		'setupVariables',
		'overwrittenVariables',
		'usedSetupVariables',
		'detectedClasses',
		'isAssertionLess',
		'doesOverwritesSetup',
		'doesUseSetupVariables',
		'doesReferenceManyClasses'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDSmellResult >> asResultForDrTest [ 

	^ DTTreeLeafNode content: (self testClass selector: self selector)
]

{ #category : 'accessing' }
TSDSmellResult >> detectedClasses [

	^ detectedClasses
]

{ #category : 'accessing' }
TSDSmellResult >> detectedClasses: anObject [

	detectedClasses := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> doesOverwritesSetup [

	^ doesOverwritesSetup
]

{ #category : 'accessing' }
TSDSmellResult >> doesOverwritesSetup: anObject [

	doesOverwritesSetup := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> doesReferenceManyClasses [

	^ doesReferenceManyClasses
]

{ #category : 'accessing' }
TSDSmellResult >> doesReferenceManyClasses: anObject [

	doesReferenceManyClasses := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> doesUseSetupVariables [

	^ doesUseSetupVariables
]

{ #category : 'accessing' }
TSDSmellResult >> doesUseSetupVariables: anObject [

	doesUseSetupVariables := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> isAssertionLess [

	^ isAssertionLess
]

{ #category : 'accessing' }
TSDSmellResult >> isAssertionLess: anObject [

	isAssertionLess := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> overwrittenVariables [

	^ overwrittenVariables
]

{ #category : 'accessing' }
TSDSmellResult >> overwrittenVariables: anObject [

	overwrittenVariables := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> selector [

	^ selector
]

{ #category : 'accessing' }
TSDSmellResult >> selector: anObject [

	selector := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> setupVariables [

	^ setupVariables
]

{ #category : 'accessing' }
TSDSmellResult >> setupVariables: anObject [

	setupVariables := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> testClass [

	^ testClass 
]

{ #category : 'accessing' }
TSDSmellResult >> testClass: anObject [

	testClass := anObject
]

{ #category : 'accessing' }
TSDSmellResult >> usedSetupVariables [

	^ usedSetupVariables
]

{ #category : 'accessing' }
TSDSmellResult >> usedSetupVariables: anObject [

	usedSetupVariables := anObject
]
