extends Panel

func _on_watch_out_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "WatchOut"
	get_tree().change_scene_to_file("res://Worlds/Set3/WatchOut.tscn")


func _on_forward_thinking_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "ForwardThinking"
	get_tree().change_scene_to_file("res://Worlds/Set3/ForwardThinking.tscn")


func _on_charge_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "Charge"
	get_tree().change_scene_to_file("res://Worlds/Set3/Charge.tscn")


func _on_the_run_down_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "TheRunDown"
	get_tree().change_scene_to_file("res://Worlds/Set3/TheRunDown.tscn")


func _on_there_be_walls_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "ThereBeWalls"
	get_tree().change_scene_to_file("res://Worlds/Set3/ThereBeWalls.tscn")


func _on_is_it_really_a_wall_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "IsItReallyAWalls"
	get_tree().change_scene_to_file("res://Worlds/Set3/IsItReallyAWall.tscn")


func _on_look_up_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "LookUp"
	get_tree().change_scene_to_file("res://Worlds/Set3/LookUp.tscn")


func _on_renegade_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "Renegade"
	get_tree().change_scene_to_file("res://Worlds/Set3/Renegade.tscn")


func _on_the_gauntlet_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "TheGauntlet"
	get_tree().change_scene_to_file("res://Worlds/Set3/TheGauntlet.tscn")


func _on_run_for_it_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "RunForIt"
	get_tree().change_scene_to_file("res://Worlds/Set3/RunForIt.tscn")
