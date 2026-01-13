"
I am the result report for the MethodMessageAnalyzer plugin for DrTests
"
Class {
	#name : 'DTMaResult',
	#superclass : 'DTPluginResult',
	#instVars : [
		'result'
	],
	#category : 'DrTests-MethodMessagesAnalyzer',
	#package : 'DrTests-MethodMessagesAnalyzer'
}

{ #category : 'accessing' }
DTMaResult >> buildTreeForUI [
	
	<dtTestMaResultTreeNamed: 'List of analyzed methods' order: 1>
	^ DTTreeNode new subResults: { (DTTreeNode new 
			name: 'Analyzed methods';
			subResults:
				(Set new )
			yourself) }
]
