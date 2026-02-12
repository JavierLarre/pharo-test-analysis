"
A DTRTDPluginTest is a test class for testing the behavior of DTRTDPlugin
"
Class {
	#name : 'DTRTDPluginTest',
	#superclass : 'TestCase',
	#instVars : [
		'plugin'
	],
	#category : 'DrTests-RottenTestsDebugger-Tests-Presenters',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Presenters'
}

{ #category : 'running' }
DTRTDPluginTest >> setUp [
	super setUp.

	plugin := DTRTDPlugin new
]

{ #category : 'tests' }
DTRTDPluginTest >> testRunForConfiguration [

	| result |
	result := (plugin runForConfiguration: (DTPluginConfiguration
		items: { DTRTDFirstFixFakeTest }
		packages: #'DrTests-RottenTestsDebugger-FakeTests' asPackage)) buildTreeForUI subResults first.
	
	self 
		assert: result name equals: DTRTDFirstFixFakeTest name;
		assert: result subResults first name equals: 'testFirst'
]
