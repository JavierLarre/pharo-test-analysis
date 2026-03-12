Class {
	#name : 'BaselineOfFirstToFix',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFirstToFix',
	#package : 'BaselineOfFirstToFix'
}

{ #category : 'baselines' }
BaselineOfFirstToFix >> baseline: spec [
	<baseline>
	
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'RottenTestsDebugger';
				package: 'RottenTestsDebugger-Tests' with: [ spec requires: #('RottenTestsDebugger') ];
				package: 'DrTests-FirstToFix' with: [ spec requires: #('RottenTestsDebugger') ];
				package: 'DrTests-FirstToFix-Tests' with: [ spec requires: #('DrTests-FirstToFix') ];
				
				package: 'TestSmellsDetector';
				package: 'TestSmellsDetector-FakeTests';
				package: 'TestSmellsDetector-Tests' with: [ spec requires: #('TestSmellsDetector' 'TestSmellsDetector-FakeTests') ];
				package: 'DrTests-TestSmellsDetector' with: [ spec requires: #('TestSmellsDetector') ];
				package: 'DrTests-TestSmellsDetector-Tests' with: [ spec requires: #('DrTests-TestSmellsDetector' 'TestSmellsDetector-FakeTests') ] ].

			"Groups"
			spec
				group: 'Core' with: #('RottenTestsDebugger' 'TestSmellsDetector');
				group: 'Tests' with: #('FirstToFix-Tests' 'TestSmellsDetector-Tests');
				group: 'Plugins' with: #('DrTests-FirstToFix' 'DrTests-TestSmellsDetector' 'DrTests-FirstToFix-Tests' 'TestSmellsDetector-Tests');
				group: 'default' with: #('Core' 'Plugins' 'Tests');
				group: 'All' with: #('Core' 'Tests' 'Plugins')
]
