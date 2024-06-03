extends Node3D

@export var nextLevel = "octopusGame"
var rotationSpeed = 2

func _process(delta):
	self.rotation.y += rotationSpeed * delta

func _on_gem_body_entered(body):
	if body.is_in_group("player"):
		Manager.sceneName = nextLevel
		WinSound.play()
		get_tree().change_scene_to_file("res://Worlds/" + nextLevel + ".tscn")	
		Ui.time = 0
