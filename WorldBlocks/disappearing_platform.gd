class_name dg extends Node3D

@onready var animPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.resetPlatforms.connect(_reset_Platform)
	$Label3d.visible = false

func _reset_Platform():
	animPlayer.play("RESET")
	animPlayer.play("FadeInAndOut")

