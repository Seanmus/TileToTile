extends Panel

func _on_intro_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "Intro"
	get_tree().change_scene_to_file("res://Worlds/Set0/Intro.tscn")


func _on_side_to_side_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "SideToSide"
	get_tree().change_scene_to_file("res://Worlds/Set0/SideToSide.tscn")


func _on_speed_is_key_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "SpeedIsKey"
	get_tree().change_scene_to_file("res://Worlds/Set0/SpeedIsKey.tscn")


func _on_time_to_rise_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "TimeToRise"
	get_tree().change_scene_to_file("res://Worlds/Set0/TimeToRise.tscn")


func _on_lets_spin_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "LetsGoForASpin"
	get_tree().change_scene_to_file("res://Worlds/Set0/LetsGoForASpin.tscn")


func _on_hyper_drive_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "HyperDrive"
	get_tree().change_scene_to_file("res://Worlds/Set0/HyperDrive.tscn")


func _on_build_up_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "BuildUp"
	get_tree().change_scene_to_file("res://Worlds/Set0/BuildUp.tscn")


func _on_high_speed_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "HighSpeed"
	get_tree().change_scene_to_file("res://Worlds/Set0/HighSpeed.tscn")


func _on_the_long_run_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "TheLongRun"
	get_tree().change_scene_to_file("res://Worlds/Set0/TheLongRun.tscn")


func _on_the_longer_run_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "TheLongerRun"
	get_tree().change_scene_to_file("res://Worlds/Set0/TheLongerRun.tscn")
