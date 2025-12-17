"
I should find messages that are related
"
Class {
	#name : 'MyTestAnalizer',
	#superclass : 'Object',
	#category : 'MyTestAnalyzer',
	#package : 'MyTestAnalyzer'
}

{ #category : 'as yet unclassified' }
MyTestAnalizer >> returnsTrue [
	^true
]

{ #category : 'as yet unclassified' }
MyTestAnalizer >> stubMethod [
	self lookupSelector: #returnsTrue 
]
