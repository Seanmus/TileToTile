extends Node3D

@export var GoldTime : float = 5
@export var SilverTime: float = 7
@export var BronzeTime: float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	Ui._SetRoundTimes(GoldTime, SilverTime, BronzeTime)
	
