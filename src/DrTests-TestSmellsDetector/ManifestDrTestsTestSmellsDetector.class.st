"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestDrTestsTestSmellsDetector',
	#superclass : 'PackageManifest',
	#category : 'DrTests-TestSmellsDetector-Manifest',
	#package : 'DrTests-TestSmellsDetector',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestDrTestsTestSmellsDetector class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#DTTSDDetectorBuilder #buildResult:withTests: #false)) #'2026-02-13T07:48:53.588196-03:00') )
]
