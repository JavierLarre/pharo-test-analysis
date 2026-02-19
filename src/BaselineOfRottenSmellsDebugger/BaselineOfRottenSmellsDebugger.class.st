Class {
	#name : 'BaselineOfRottenSmellsDebugger',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfRottenSmellsDebugger',
	#package : 'BaselineOfRottenSmellsDebugger'
}

{ #category : 'baselines' }
BaselineOfRottenSmellsDebugger >> baseline: spec [
	<baseline>
	
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'RottenTestsDebugger';
				package: 'RottenTestsDebugger-Tests' with: [ spec requires: #('RottenTestsDebugger') ];
				package: 'DrTests-RottenTestsDebugger' with: [ spec requires: #('RottenTestsDebugger') ];
				package: 'DrTests-RottenTestsDebugger-Tests' with: [ spec requires: #('DrTests-RottenTestsDebugger') ];
				
				package: 'TestSmellsDetector';
				package: 'TestSmellsDetector-FakeTests';
				package: 'TestSmellsDetector-Tests' with: [ spec requires: #('TestSmellsDetector' 'TestSmellsDetector-FakeTests') ];
				package: 'DrTests-TestSmellsDetector' with: [ spec requires: #('TestSmellsDetector') ];
				package: 'DrTests-TestSmellsDetector-Tests' with: [ spec requires: #('DrTests-TestSmellsDetector' 'TestSmellsDetector-FakeTests') ] ].

			"Groups"
			spec
				group: 'Core' with: #('RottenTestsDebugger' 'TestSmellsDetector');
				group: 'Tests' with: #('RottenTestsDebugger-Tests' 'TestSmellsDetector-Tests');
				group: 'Plugins' with: #('DrTests-RottenTestsDebugger' 'DrTests-TestSmellsDetector' 'DrTests-RottenTestsDebugger-Tests' 'TestSmellsDetector-Tests');
				group: 'default' with: #('Core' 'Plugins');
				group: 'All' with: #('Core' 'Tests' 'Plugins')
]
