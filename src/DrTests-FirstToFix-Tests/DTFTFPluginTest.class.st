"
A DTRTDPluginTest is a test class for testing the behavior of DTRTDPlugin
"
Class {
	#name : 'DTFTFPluginTest',
	#superclass : 'TestCase',
	#instVars : [
		'plugin'
	],
	#category : 'DrTests-FirstToFix-Tests-Presenters',
	#package : 'DrTests-FirstToFix-Tests',
	#tag : 'Presenters'
}

{ #category : 'running' }
DTFTFPluginTest >> setUp [

	super setUp.

	plugin := DTFTFPlugin new.
]

{ #category : 'tests' }
DTFTFPluginTest >> testRunForConfiguration [

	| result configuration |
	configuration := DTPluginConfiguration 
		items: { DTFTFFakeTest } 
		packages: #'DrTests-RottenTestsDebugger-Tests' asPackage.
	result := (plugin runForConfiguration: configuration) buildTreeForUI subResults first.

	self
		assert: result name equals: DTFTFFakeTest name;
		assert: result subResults first name equals: 'testFirst'
]
