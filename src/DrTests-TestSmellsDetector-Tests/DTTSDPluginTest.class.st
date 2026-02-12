"
A DTTSDPluginTest is a test class for testing the behavior of DTTSDPlugin
"
Class {
	#name : 'DTTSDPluginTest',
	#superclass : 'TestCase',
	#category : 'DrTests-TestSmellsDetector-Tests-Presenters',
	#package : 'DrTests-TestSmellsDetector-Tests',
	#tag : 'Presenters'
}

{ #category : 'factory' }
DTTSDPluginTest >> runForConfiguration [

	^ DTTSDPlugin new runForConfiguration:
		  (DTPluginConfiguration items: { TSDFakeTests } packages: #'TestSmellsDetector-FakeTests' asPackage)
]

{ #category : 'tests' }
DTTSDPluginTest >> testOverwriteSetup [

	| result |
	result := self runForConfiguration.
	self
		assertCollection: (result overwrittenSetupTests collect: #selector)
		hasSameElements:
			#( testConnectedToAssignation testConnectedToAssertion testDoesNotAssert testIsConnectedToInstanceVar
			   testOnlyAssigns testUsesClasses testUsesInstanceVar testUsesLocalVariables testUsesTooManyClasses )
]

{ #category : 'tests' }
DTTSDPluginTest >> testRunForConfiguration [

	| testCase result |
	result := DTTSDPlugin new runForConfiguration:
		          (DTPluginConfiguration items: { TSDFakeTests } packages: #'TestSmellsDetector-FakeTests' asPackage).
	testCase := result assertionlessTests first.
	self assert: testCase selector equals: #testDoesNotAssert
]
