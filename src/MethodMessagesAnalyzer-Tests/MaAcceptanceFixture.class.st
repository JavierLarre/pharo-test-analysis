"
I store pre-defined methods for use in analyzer graph tests
"
Class {
	#name : 'MaAcceptanceFixture',
	#superclass : 'Object',
	#category : 'MethodMessagesAnalyzer-Tests',
	#package : 'MethodMessagesAnalyzer-Tests'
}

{ #category : 'accessing' }
MaAcceptanceFixture >> bar [
	self end
]

{ #category : 'accessing' }
MaAcceptanceFixture >> cycle1 [
	self cycle2
]

{ #category : 'accessing' }
MaAcceptanceFixture >> cycle2 [
	self cycle1
]

{ #category : 'accessing' }
MaAcceptanceFixture >> end [
	"empty"
]

{ #category : 'accessing' }
MaAcceptanceFixture >> foo [ 
	self y.
	self assert: self bar 
]

{ #category : 'accessing' }
MaAcceptanceFixture >> root [
	self x y z
]

{ #category : 'accessing' }
MaAcceptanceFixture >> x [ 
	self end
]

{ #category : 'accessing' }
MaAcceptanceFixture >> y [ 
	self end 
]

{ #category : 'accessing' }
MaAcceptanceFixture >> z [
	self cycle1 
]
