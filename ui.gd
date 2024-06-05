extends Control


@onready var topDownCamera = $miniMap/topDown/topDownCamera
@onready var topDownViewPort = $miniMap/topDown
@onready var levelTime = $levelTime
@onready var gameTime = $gameTime
@onready var miniMap = $miniMap

@onready var GoldTimeLabel = $GoldTime
@onready var SilverTimeLabel = $SilverTime
@onready var BronzeTimeLabel = $BronzeTime

@onready var GoldTrophy = $GoldTrophy
@onready var SilverTrophy = $SilverTrophy
@onready var BronzeTrophy = $BronzeTrophy

var GoldTime : float
var SilverTime : float
var BronzeTime : float

# Called when the node enters the scene tree for the first time.
func _ready():	
	Manager.addTime.connect(_addTime)
	_hide()

func _SetRoundTimes(Gold, Silver, Bronze):
	GoldTime = Gold
	SilverTime = Silver
	BronzeTime = Bronze
	GoldTimeLabel.text =   "%02d.%02d" % [Gold, fmod(Gold,1) * 1000]
	SilverTimeLabel.text = "%02d.%02d" % [Silver, fmod(Silver,1) * 1000]
	BronzeTimeLabel.text = "%02d.%02d" % [Bronze, fmod(Bronze,1) * 1000]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	levelTime.text = "%02d.%02d" % [Manager.roundTime, fmod(Manager.roundTime,1) * 1000]
	gameTime.text = "%02d.%02d" % [Manager.totalTime, fmod(Manager.totalTime,1) * 1000]
	_HighlightTime()
	if Input.is_action_just_pressed("escape"):
		Manager.totalTime = 1000
		get_tree().change_scene_to_file("res://Worlds/title.tscn")
		

func _HighlightTime():
	GoldTrophy.visible = false
	SilverTrophy.visible = false
	BronzeTrophy.visible = false
	if Manager.roundTime <= GoldTime:
		$GoldTrophy.visible = true
	elif Manager.roundTime <= SilverTime:
		$SilverTrophy.visible = true
	elif Manager.roundTime <= BronzeTime:
		$BronzeTrophy.visible = true
	
func _show():
	levelTime.visible = true 
	gameTime.visible = true
	miniMap.visible = true
	
	GoldTimeLabel.visible = true
	SilverTimeLabel.visible = true
	BronzeTimeLabel.visible = true
	
	
func _hide():
	GoldTrophy.visible = false
	SilverTrophy.visible = false
	BronzeTrophy.visible = false
	
	GoldTimeLabel.visible = false
	SilverTimeLabel.visible = false
	BronzeTimeLabel.visible = false
	
	miniMap.visible = false
	levelTime.visible = false
	gameTime.visible = false

func _addTime():
	$levelTime/levelTimeAddTimeAnim.play("addTime")
