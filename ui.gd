extends Control


@onready var topDownCamera = $miniMap/topDown/topDownCamera
@onready var topDownViewPort = $miniMap/topDown
@onready var levelTime = $levelTime
@onready var gameTime = $gameTime
@onready var miniMap = $miniMap

@onready var GoldTimeLabel = $GoldTime
@onready var SilverTimeLabel = $SilverTime
@onready var BronzeTimeLabel = $BronzeTime

var GoldTime : float
var SilverTime : float
var BronzeTime : float

# Called when the node enters the scene tree for the first time.
func _ready():	
	Manager.addTime.connect(_addTime)
	_hide()

func _SetRoundTimes(Gold, Silver, Bronze):
	GoldTimeLabel.text =   "Gold Time: %02d.%02d" % [Gold, fmod(Gold,1) * 1000]
	SilverTimeLabel.text = "Silver Time: %02d.%02d" % [Silver, fmod(Silver,1) * 1000]
	BronzeTimeLabel.text = "Bronze Time: %02d.%02d" % [Bronze, fmod(Bronze,1) * 1000]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	levelTime.text = "%02d.%02d" % [Manager.roundTime, fmod(Manager.roundTime,1) * 1000]
	gameTime.text = "%02d.%02d" % [Manager.totalTime, fmod(Manager.totalTime,1) * 1000]
	if Input.is_action_just_pressed("escape"):
		Manager.totalTime = 1000
		get_tree().change_scene_to_file("res://Worlds/title.tscn")	
	
func _show():
	levelTime.visible = true 
	gameTime.visible = true
	miniMap.visible = true
	
func _hide():
	miniMap.visible = false	
	levelTime.visible = false
	gameTime.visible = false

func _addTime():
	$levelTime/levelTimeAddTimeAnim.play("addTime")
