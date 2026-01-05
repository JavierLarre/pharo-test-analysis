"
I store pre-defined methods for use in analyzer graph tests
"
Class {
	#name : 'MaFixtureWithCycles',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MaFixtureWithCycles >> bar [
	self end
]

{ #category : 'accessing' }
MaFixtureWithCycles >> cycle1 [
	self cycle2
]

{ #category : 'accessing' }
MaFixtureWithCycles >> cycle2 [
	self cycle1
]

{ #category : 'accessing' }
MaFixtureWithCycles >> end [
	"empty"
]

{ #category : 'accessing' }
MaFixtureWithCycles >> foo [ 
	self y.
	self assert: self bar 
]

{ #category : 'accessing' }
MaFixtureWithCycles >> root [
	self x y z
]

{ #category : 'accessing' }
MaFixtureWithCycles >> x [ 
	self end
]

{ #category : 'accessing' }
MaFixtureWithCycles >> y [ 
	self end 
]

{ #category : 'accessing' }
MaFixtureWithCycles >> z [
	self cycle1 
]
