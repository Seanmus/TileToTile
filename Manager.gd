extends Node
@onready var audioBus := AudioServer.get_bus_index("Master")
var sceneName = "tutorial"

signal resetPlatforms
signal addTime

var bestTime = 10000
var totalTime = 0
#Set on the end level node
var roundTime = 0

var showPlatformTime = 4

var mapTimes = {}

var verticalMouseLocked = true
var mouseSensitivity = 0.0015


func _ready():
	AudioServer.set_bus_volume_db(audioBus, -30)

func _physics_process(delta):
	totalTime += delta
	roundTime += delta

func _MapFinished():
	mapTimes[sceneName] = roundTime
	print(mapTimes)

func _ResetPlatforms():
	totalTime += showPlatformTime
	roundTime += showPlatformTime
	addTime.emit()
	resetPlatforms.emit()
