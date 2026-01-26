"
A DTRTDPriorityVisitorTest is a test class for testing the behavior of DTRTDPriorityVisitor
"
Class {
	#name : 'DTRTDPriorityVisitorTest',
	#superclass : 'DTRTDTestCaseVisitorTest',
	#category : 'DrTests-RottenTestsDebugger-Tests-Visitors',
	#package : 'DrTests-RottenTestsDebugger-Tests',
	#tag : 'Visitors'
}

{ #category : 'utilities' }
DTRTDPriorityVisitorTest >> priorityTestCase: aSelector [

	^ viewModel testCasesPriorities detect: [ :priorityTestCase | 
		priorityTestCase testMethod = (self fixtureClass >> aSelector ) ]
]

{ #category : 'tests' }
DTRTDPriorityVisitorTest >> testEmptyMethodsAreIgnored [

	| emptyMethod |
	emptyMethod := self fixtureClass >> #emptyMethod.
	self
		deny: ((self priorityTestCase: #testMethod) higherPriorityCases anySatisfy: [ :testCaseViewModel |
			testCaseViewModel testMethod = emptyMethod ])
]

{ #category : 'factory' }
DTRTDPriorityVisitorTest >> visitorClass [

	^ DTRTDPriorityVisitor 
]
