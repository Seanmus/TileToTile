extends Node
@onready var audioBus := AudioServer.get_bus_index("Master")
var sceneName = "tutorial"

var bestTime = 10000
var totalTime = 0

func _ready():
	AudioServer.set_bus_volume_db(audioBus, -30)

func _physics_process(delta):
	totalTime += delta