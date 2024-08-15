extends Area3D

@onready var explodeCloud = load("res://WorldBlocks/jumpCloud.tscn")
#Destroys the cannonball when after its animation has finished playing
func _on_animation_player_animation_finished(_anim_name):
	queue_free()
	
func explode():
	var cloud = explodeCloud.instantiate()
	add_child(cloud)
	$ball.visible = false


func _on_body_entered(body):
	print("Body entered")
	if body.is_in_group("player"):
		Manager.roundTime = 0
		body._respawn()
	else:
		call_deferred("HitWall")

func HitWall():
	$AnimationPlayer.seek(3, true, false)
