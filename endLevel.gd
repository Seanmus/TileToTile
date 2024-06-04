extends Node3D

@export var nextLevel = "octopusGame"
var rotationSpeed = 2



func _process(delta):
	self.rotation.y += rotationSpeed * delta

func _on_gem_body_entered(body):
	if body.is_in_group("player"):
		WinSound.play()
		var map = get_parent()
		print(map.name)
		Manager._MapFinished()
		call_deferred("_nextScene")
		Manager.roundTime = 0
		
func _nextScene():
	Manager.sceneName = nextLevel
	get_tree().change_scene_to_file("res://Worlds/" + nextLevel + ".tscn")	
