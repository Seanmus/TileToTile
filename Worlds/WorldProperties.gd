extends Node3D

@export var GoldTime : float = 5
@export var SilverTime: float = 7
@export var BronzeTime: float = 10
var sceneFilePath

# Called when the node enters the scene tree for the first time.
func _ready():	
	print(sceneFilePath)
	print(sceneFilePath)
	Ui._SetRoundTimes(GoldTime, SilverTime, BronzeTime)
	Manager._LoadLeaderboard()
	
