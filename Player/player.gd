extends CharacterBody3D


const SPEED = 4.5
var currentSpeed = SPEED
const MAXSPEED = 20
const JUMP_VELOCITY = 4.4
var mouse_sensitivty = Manager.mouseSensitivity
var controller_sensitivity = 0.05
var spawnPos
var landing : bool 
var coyoteTime : bool
var jumped : bool
var startedMoving : bool
@onready var coyoteTimer = $coyoteTimer
@onready var anim = $AnimationPlayer
@onready var landed = $landed

@onready var speedEffect = $Pivot/SpeedEffect

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Manager.roundTime = 0
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	spawnPos = global_transform
	Ui._show()
	landing = false

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivty)
		if !Manager.verticalMouseLocked:
			$Pivot.rotate_x(-event.relative.y * mouse_sensitivty)
		
func _physics_process(delta):
	if Manager.paused:
		return
	if Input.is_action_just_pressed("click") && Manager.roundTime >= 1:
		Manager._ResetPlatforms()
	
	var cameraInput = Input.get_vector("look_left", "look_right", "look_up", "look_down")
	if cameraInput:
		rotate_y(-cameraInput.x * controller_sensitivity)
		#rotate_x(cameraInput.y * controller_sensitivity)
	
	if not is_on_floor():
		if(landing):
			coyoteTime = true
			coyoteTimer.start()
		landing = false
		velocity.y -= gravity * delta
		if velocity.y <= 0:
			velocity.y -= gravity * delta * 0.5
	else:
		if !landing:
			landing = true
			jumped = false
			anim.play("landing")
			landed.play()
	# Handles Jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() || coyoteTime) and not jumped:
		velocity.y = JUMP_VELOCITY
		jumped = true	
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		currentSpeed += 0.5 * delta
		currentSpeed = clamp(currentSpeed, SPEED, MAXSPEED)
		if input_dir.y < 0:
			speedEffect.visible = true
			speedEffect.initial_velocity_max = 88 * (currentSpeed / 4.5)
			speedEffect.initial_velocity_min = 88 * (currentSpeed / 4.5)
		else:
			speedEffect.visible = false
		velocity.x = direction.x * currentSpeed
		velocity.z = direction.z * currentSpeed
		Ui.playerSpeed = round(currentSpeed * 20) 
		if not startedMoving:
			anim.play("move")
			startedMoving = true
	else:
		currentSpeed = SPEED
		Ui.playerSpeed = 0
		speedEffect.visible = false
		velocity.x = move_toward(velocity.x, 0, SPEED/2)
		velocity.z = move_toward(velocity.z, 0, SPEED/2)
		startedMoving = false

	move_and_slide()

func _respawn():
	Manager.roundTime = 0
	call_deferred("_resetScene")


func _resetScene():
	get_tree().change_scene_to_file(get_tree().current_scene.scene_file_path)	


func _on_coyote_timer_timeout():
	coyoteTime = false
