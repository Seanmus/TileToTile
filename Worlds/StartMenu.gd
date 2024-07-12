extends Control


@onready var audioBus := AudioServer.get_bus_index("Master")
# Called when the node enters the scene tree for the first time.


func _ready():
	$Settings/Panel/MouseSensitivitySlider.value = Manager.mouseSensitivity * 1000
	$Settings/Panel/LockVerticalCheckBox.button_pressed = Manager.verticalMouseLocked
	
	$MenuButtons/Button.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Manager.totalTime > 10:
		if Manager.totalTime < Manager.bestTime:
			Manager.bestTime = Manager.totalTime
		$MenuButtons/bestTIme.text = "%02d.%02d" % [Manager.bestTime, fmod(Manager.bestTime,1) * 1000]	
	Ui._hide()
	$MenuButtons.visible = true
	$Section1.visible = false
	$Settings.visible = false
	
func _on_button_pressed():
	Manager.totalTime = 0
	Manager.roundTime = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
	get_tree().change_scene_to_file("res://Worlds/Set1/Tutorial.tscn")
	
func _on_level_select_btn_pressed():
	Manager.gameMode = Manager.GAME_MODES.LEVEL
	print("Selected Level select")
	$CourseSelect.visible = true
	$ModeSelectPanel.visible = false
	$MenuButtons.visible = false
	$Settings.visible = false


func _on_back_btn_pressed():
	$Section1.visible = false
	$ModeSelectPanel.visible = false
	$CourseSelect.visible = false
	$Settings.visible = false
	$MenuButtons.visible = true


func _on_level_1_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "Tutorial"
	Manager.scene_file_path = "Set1/Tutorial"
	get_tree().change_scene_to_file("res://Worlds/Set1/Tutorial.tscn")


func _on_level_2_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "MirrorMirage"
	get_tree().change_scene_to_file("res://Worlds/Set1/MirrorMirage.tscn")


func _on_level_3_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "OcotpusGame"
	get_tree().change_scene_to_file("res://Worlds/Set1/OctopusGame.tscn")


func _on_level_4_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "WindingRoad"
	get_tree().change_scene_to_file("res://Worlds/Set1/WindingRoad.tscn")



func _on_level_5_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "ARisingTide"
	get_tree().change_scene_to_file("res://Worlds/Set1/ARisingTide.tscn")



func _on_level_6_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "IsThatAWall"
	get_tree().change_scene_to_file("res://Worlds/Set1/IsThatAWall.tscn")



func _on_level_7_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "RunThrough"
	get_tree().change_scene_to_file("res://Worlds/Set1/RunThrough.tscn")



func _on_level_8_pressed():
	Manager.sceneName = "ThePass"
	Manager.totalTime = 1000	
	get_tree().change_scene_to_file("res://Worlds/Set1/ThePass.tscn")



func _on_level_9_pressed():	
	Manager.sceneName = "WallClimber"
	Manager.totalTime = 1000
	get_tree().change_scene_to_file("res://Worlds/Set1/WallClimber.tscn")



func _on_level_10_pressed():
	Manager.sceneName = "TheFinale"
	Manager.totalTime = 1000
	get_tree().change_scene_to_file("res://Worlds/Set1/TheFinale.tscn")


func _on_settings_btn_pressed():
	$MenuButtons.visible = false
	$Section1.visible = false
	$Settings.visible = true


func _on_audio_slider_value_changed(value):
	AudioServer.set_bus_volume_db(audioBus, -60 + value * 60)


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_lock_vertical_check_box_toggled(toggled_on):
	Manager.verticalMouseLocked = toggled_on


func _on_mouse_sensitivity_slider_value_changed(value):
	Manager.mouseSensitivity = value/1000


func _on_course_1_pressed():
	if(Manager.gameMode == Manager.GAME_MODES.SET):
		Manager.totalTime = 0
		get_tree().change_scene_to_file("res://Worlds/Set1/Tutorial.tscn")
	else:
		$Section1.visible = true
		$CourseSelect.visible = false
		$MenuButtons.visible = false
		$Settings.visible = false


func _on_course_select_back_btn_pressed():
	$Section1.visible = false
	$CourseSelect.visible = false
	$MenuButtons.visible = true
	$Settings.visible = false


func _on_play_pressed():
	$ModeSelectPanel.visible = true
	$MenuButtons.visible = false


func _on_set_pressed():
	$ModeSelectPanel.visible = false
	Manager.gameMode = Manager.GAME_MODES.SET
	$CourseSelect.visible = true


func _on_courseSelectBack_btn_pressed():
	$ModeSelectPanel.visible = true
	$Section1.visible = false
	$CourseSelect.visible = false
	$MenuButtons.visible = false
	$Settings.visible = false


func _on_levelSelectBack_btn_pressed():
	$CourseSelect.visible = true
	$ModeSelectPanel.visible = false
	$Section1.visible = false
	$Section0.visible = false


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


func _on_course_0_pressed():
	if(Manager.gameMode == Manager.GAME_MODES.SET):
		Manager.totalTime = 0
		get_tree().change_scene_to_file("res://Worlds/Set0/Intro.tscn")
	else:
		$CourseSelect.visible = false
		$Section0.visible = true


func _on_gauntlet_pressed():
	$ModeSelectPanel.visible = false
	Manager.gameMode = Manager.GAME_MODES.GAUNTLET
	Manager.totalTime = 0
	Manager.roundTime = 0
	get_tree().change_scene_to_file("res://Worlds/Set0/Intro.tscn")
