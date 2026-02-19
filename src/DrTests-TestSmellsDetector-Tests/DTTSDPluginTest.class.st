"
A DTTSDPluginTest is a test class for testing the behavior of DTTSDPlugin
"
Class {
	#name : 'DTTSDPluginTest',
	#superclass : 'TestCase',
	#instVars : [
		'testData'
	],
	#category : 'DrTests-TestSmellsDetector-Tests-Presenters',
	#package : 'DrTests-TestSmellsDetector-Tests',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDPluginTest >> data [ 

	^ testData ifNil: [ testData := self runForConfiguration testData ]
]

{ #category : 'factory' }
DTTSDPluginTest >> runForConfiguration [

	^ DTTSDPlugin new runForConfiguration:
		  (DTPluginConfiguration items: { TSDFakeTests } packages: #'TestSmellsDetector-FakeTests' asPackage)
]

{ #category : 'tests' }
DTTSDPluginTest >> testAssertionless [

	self
		assertCollection: (self data assertionlessTests collect: #selector)
		includesAll:
			#( testDoesNotAssert 
				testUsesClasses 
				testUsesTooManyClasses )
]

{ #category : 'tests' }
DTTSDPluginTest >> testManyClassReferences [

	self
		assertCollection: (self data manyClassReferencesTests collect: #selector)
		includesAll: #( testUsesTooManyClasses testUsesTheSameClass )
]

{ #category : 'tests' }
DTTSDPluginTest >> testOverwriteSetup [

	self
		assertCollection: (self data overwrittenSetupTests collect: #selector)
		includesAll:
			#( testConnectedToAssignation 
			   testOnlyAssigns   )
]

{ #category : 'tests' }
DTTSDPluginTest >> testRunForConfiguration [

	self 
		assert: self data assertionlessTests first selector 
		equals: #testDoesNotAssert
]

{ #category : 'tests' }
DTTSDPluginTest >> testUselessSetup [

	| uselessSetupTests |
	uselessSetupTests := self data uselessSetupTests collect: #selector.

	self
		assertCollection: uselessSetupTests 
		includesAll: #( testOnlyAssigns testConnectedToAssignation testUsesLocalVariables );
		denyCollection: uselessSetupTests 
		includesAny: #( testUsesInstanceVar )
]
