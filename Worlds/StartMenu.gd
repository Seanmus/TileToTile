extends Control


@onready var audioBus := AudioServer.get_bus_index("Master")
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuButtons/Button.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Manager.totalTime > 10:
		if Manager.totalTime < Manager.bestTime:
			Manager.bestTime = Manager.totalTime
		$MenuButtons/bestTIme.text = "%02d.%02d" % [Manager.bestTime, fmod(Manager.bestTime,1) * 1000]	
	Ui._hide()
	$MenuButtons.visible = true
	$LevelSelect.visible = false
	$Settings.visible = false
	
func _on_button_pressed():
	Manager.totalTime = 0
	Manager.roundTime = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
	get_tree().change_scene_to_file("res://Worlds/Tutorial.tscn")
	
func _on_level_select_btn_pressed():
	$LevelSelect.visible = true
	$MenuButtons.visible = false
	$Settings.visible = false


func _on_back_btn_pressed():
	$LevelSelect.visible = false
	$MenuButtons.visible = true
	$Settings.visible = false


func _on_level_1_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "Tutorial"
	get_tree().change_scene_to_file("res://Worlds/Tutorial.tscn")


func _on_level_2_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "MirrorMirage"
	get_tree().change_scene_to_file("res://Worlds/MirrorMirage.tscn")


func _on_level_3_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "OcotpusGame"
	get_tree().change_scene_to_file("res://Worlds/OctopusGame.tscn")


func _on_level_4_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "WindingRoad"
	get_tree().change_scene_to_file("res://Worlds/WindingRoad.tscn")



func _on_level_5_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "ARisingTide"
	get_tree().change_scene_to_file("res://Worlds/ARisingTide.tscn")



func _on_level_6_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "IsThatAWall"
	get_tree().change_scene_to_file("res://Worlds/IsThatAWall.tscn")



func _on_level_7_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "RunThrough"
	get_tree().change_scene_to_file("res://Worlds/RunThrough.tscn")



func _on_level_8_pressed():
	Manager.sceneName = "ThePass"
	Manager.totalTime = 1000	
	get_tree().change_scene_to_file("res://Worlds/ThePass.tscn")



func _on_level_9_pressed():	
	Manager.sceneName = "WallClimber"
	Manager.totalTime = 1000
	get_tree().change_scene_to_file("res://Worlds/WallClimber.tscn")



func _on_level_10_pressed():
	Manager.sceneName = "TheFinale"
	Manager.totalTime = 1000
	get_tree().change_scene_to_file("res://Worlds/TheFinale.tscn")


func _on_settings_btn_pressed():
	$MenuButtons.visible = false
	$LevelSelect.visible = false
	$Settings.visible = true


func _on_audio_slider_value_changed(value):
	AudioServer.set_bus_volume_db(audioBus, -60 + value * 60)


func _on_quit_btn_pressed():
	get_tree().quit()
