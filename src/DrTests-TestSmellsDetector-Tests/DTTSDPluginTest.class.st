"
A DTTSDPluginTest is a test class for testing the behavior of DTTSDPlugin
"
Class {
	#name : 'DTTSDPluginTest',
	#superclass : 'TestCase',
	#instVars : [
		'result'
	],
	#category : 'DrTests-TestSmellsDetector-Tests-Presenters',
	#package : 'DrTests-TestSmellsDetector-Tests',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
DTTSDPluginTest >> result [ 

	^ result ifNil: [ result := self runForConfiguration ]
]

{ #category : 'factory' }
DTTSDPluginTest >> runForConfiguration [

	^ DTTSDPlugin new runForConfiguration:
		  (DTPluginConfiguration items: { TSDFakeTests } packages: #'TestSmellsDetector-FakeTests' asPackage)
]

{ #category : 'tests' }
DTTSDPluginTest >> testAssertionless [

	self
		assertCollection: (self result assertionlessTests collect: #selector)
		includesAll:
			#( testDoesNotAssert 
				testUsesClasses 
				testUsesTooManyClasses )
]

{ #category : 'tests' }
DTTSDPluginTest >> testManyClassReferences [

	self
		assertCollection: (self result manyClassReferencesTests collect: #selector)
		includesAll: #( testUsesTooManyClasses testUsesTheSameClass )
]

{ #category : 'tests' }
DTTSDPluginTest >> testOverwriteSetup [

	self
		assertCollection: (self result overwrittenSetupTests collect: #selector)
		includesAll:
			#( testConnectedToAssignation 
				testIsConnectedToInstanceVar
			   testOnlyAssigns 
				testUsesInstanceVar  )
]

{ #category : 'tests' }
DTTSDPluginTest >> testRunForConfiguration [

	self 
		assert: self result assertionlessTests first selector 
		equals: #testDoesNotAssert
]

{ #category : 'tests' }
DTTSDPluginTest >> testUselessSetup [

	| uselessSetupTests |
	uselessSetupTests := self result uselessSetupTests collect: #selector.

	self
		assertCollection: uselessSetupTests 
		includesAll: #( testOnlyAssigns testConnectedToAssignation testUsesLocalVariables );
		denyCollection: uselessSetupTests 
		includesAny: #( testUsesInstanceVar )
]
