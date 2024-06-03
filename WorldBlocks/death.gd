extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_death_body_entered(body):
	print("Body entered")
	if body.is_in_group("player"):
		Ui.time = 0
		body._respawn()
