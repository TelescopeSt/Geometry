"
Description
--------------------

I represent a geometric vector. I have a state close to the state of a GPoint but a vector only represent a direction and a length.

My direction will go from the origin of the plan ( (0, 0) in a 2D plan) to my coordinates. My length will be defined by my coordinates.

Examples
--------------------

	""Instance creation""
	GVector withCollection: #(1 2).	 ""a GVector(1,2)""
	
	GVector coordinates: (GCoordinates withCollection: #(1 3)). 	""a GVector(1,3)""
	
	(GCoordinates withCollection: #(1 3)) asGVector.	""a GVector(1,3)""
	
	#(1 2) asGVector.	""a GVector(1,2)""	
			
	""Arithmetic""	
	#(3 5) asGVector length.	""5.830951894845301""
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	coordinates:		<GCoordinates> 	Coordinates defining my direction and length.

"
Class {
	#name : #GVector,
	#superclass : #GObject,
	#traits : 'TGWithCoordinates',
	#classTraits : 'TGWithCoordinates classTrait',
	#instVars : [
		'coordinates'
	],
	#category : #'Geometry-Core'
}

{ #category : #'instance creation' }
GVector class >> coordinates: aCoordinates [
	^ self new
		coordinates: aCoordinates;
		yourself
]

{ #category : #'instance creation' }
GVector class >> withCollection: aCollection [
	^ self coordinates: (GCoordinates withCollection: aCollection)
]

{ #category : #'instance creation' }
GVector class >> x: aNumber y: anotherNumber [
	^ self new
		coordinates: (G2DCoordinates x: aNumber y: anotherNumber);
		yourself
]

{ #category : #arithmetic }
GVector >> * anOperand [
	^ anOperand multiplyWithVector: self
]

{ #category : #arithmetic }
GVector >> + anOperand [
	^ anOperand additionWithVector: self
]

{ #category : #arithmetic }
GVector >> / aGVector [ 
	self shouldBeImplemented.
]

{ #category : #comparing }
GVector >> = anotherPoint [
	"Answer whether the receiver and anObject represent the same object."

	self == anotherPoint ifTrue: [ ^ true ].
	self class = anotherPoint class ifFalse: [ ^ false ].

	^ coordinates = anotherPoint coordinates
]

{ #category : #arithmetic }
GVector >> adaptToNumber: anInteger andSend: aString [ 
	^ self perform: aString with: anInteger
]

{ #category : #arithmetic }
GVector >> additionWithVector: aGVector [
	^ (self coordinates + aGVector coordinates) asGVector
]

{ #category : #accessing }
GVector >> coordinates [
	^ coordinates
]

{ #category : #accessing }
GVector >> coordinates: anObject [
	coordinates := anObject
]

{ #category : #comparing }
GVector >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	| coordHash |
	coordHash := coordinates hash.
	^ coordHash squared + coordHash "Try to avoid collisions with GAbstractCoordinates and GPoint"
]

{ #category : #accessing }
GVector >> length [
	"https://onlinemschool.com/math/library/vector/length/"

	^ (self coordinates inject: 0 into: [ :res :number | res + number squared ]) sqrt
]

{ #category : #arithmetic }
GVector >> multiplyWithVector: aGVector [
	"We should implement vector product later."
	
	self shouldBeImplemented
]