extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rise_up_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "RiseUp"
	get_tree().change_scene_to_file("res://Worlds/Set2/RiseUp.tscn")


func _on_spring_time_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "SpringTime"
	get_tree().change_scene_to_file("res://Worlds/Set2/SpringTime.tscn")


func _on_a_bounce_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "ABounce"
	get_tree().change_scene_to_file("res://Worlds/Set2/ABounce.tscn")


func _on_go_high_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "GoHigh"
	get_tree().change_scene_to_file("res://Worlds/Set2/GoHigh.tscn")


func _on_now_low_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "NowLow"
	get_tree().change_scene_to_file("res://Worlds/Set2/NowLow.tscn")


func _on_long_jumping_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "LongJumping"
	get_tree().change_scene_to_file("res://Worlds/Set2/LongJumping.tscn")


func _on_glass_ceiling_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "TheGlassCeiling"
	get_tree().change_scene_to_file("res://Worlds/Set2/TheGlassCeiling.tscn")


func _on_up_and_around_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "UpAndAround"
	get_tree().change_scene_to_file("res://Worlds/Set2/UpAndAround.tscn")


func _on_jump_forward_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "JumpForward"
	get_tree().change_scene_to_file("res://Worlds/Set2/JumpForward.tscn")


func _on_leap_of_faith_pressed():
	Manager.totalTime = 1000
	Manager.sceneName = "LeapOfFaith"
	get_tree().change_scene_to_file("res://Worlds/Set2/LeapOfFaith.tscn")
