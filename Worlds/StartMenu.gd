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
	get_tree().change_scene_to_file("res://Worlds/tutorial.tscn")
	
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
	Manager.sceneName = "tutorial"
	get_tree().change_scene_to_file("res://Worlds/tutorial.tscn")


func _on_level_2_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "world"
	get_tree().change_scene_to_file("res://Worlds/world.tscn")


func _on_level_3_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "ocotpusGame"
	get_tree().change_scene_to_file("res://Worlds/octopusGame.tscn")


func _on_level_4_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "octopusGame2"
	get_tree().change_scene_to_file("res://Worlds/octopusGame2.tscn")



func _on_level_5_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "octopusGame3"
	get_tree().change_scene_to_file("res://Worlds/octopusGame3.tscn")



func _on_level_6_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "octopusGame4"
	get_tree().change_scene_to_file("res://Worlds/octopusGame4.tscn")



func _on_level_7_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "octopusGame5"
	get_tree().change_scene_to_file("res://Worlds/octopusGame5.tscn")



func _on_level_8_pressed():
	Manager.sceneName = "octopusGame6"
	Manager.totalTime = 1000	
	get_tree().change_scene_to_file("res://Worlds/octopusGame6.tscn")



func _on_level_9_pressed():	
	Manager.sceneName = "octopusGame7"
	Manager.totalTime = 1000
	get_tree().change_scene_to_file("res://Worlds/octopusGame7.tscn")



func _on_level_10_pressed():
	Manager.sceneName = "octopusGame8"
	Manager.totalTime = 1000
	get_tree().change_scene_to_file("res://Worlds/octopusGame8.tscn")


func _on_settings_btn_pressed():
	$MenuButtons.visible = false
	$LevelSelect.visible = false
	$Settings.visible = true


func _on_audio_slider_value_changed(value):
	AudioServer.set_bus_volume_db(audioBus, -60 + value * 60)


func _on_quit_btn_pressed():
	get_tree().quit()
