Class {
	#name : 'TSDOverwrittenSetupResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'overwrittenVariables'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> overwrittenVariables [

	^ overwrittenVariables
]

{ #category : 'accessing' }
TSDOverwrittenSetupResult >> overwrittenVariables: anObject [

	overwrittenVariables := anObject
]
