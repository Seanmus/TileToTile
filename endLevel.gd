extends Node3D

@export var nextLevel = "octopusGame"
var rotationSpeed = 2

func _process(delta):
	self.rotation.y += rotationSpeed * delta

func _on_gem_body_entered(body):
	if body.is_in_group("player"):
		Manager.sceneName = nextLevel
		WinSound.play()
		call_deferred("_nextScene")
		Ui.time = 0
		
func _nextScene():
	get_tree().change_scene_to_file("res://Worlds/" + nextLevel + ".tscn")	
