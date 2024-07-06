extends Node
@onready var audioBus := AudioServer.get_bus_index("Master")
var sceneName = "tutorial"
var scenePath = "tutorial"

signal resetPlatforms
signal addTime

var bestTime = 10000
var totalTime = 0
#Set on the end level node
var roundTime = 0.0

var showPlatformTime = 4

var mapTimes = {}

var verticalMouseLocked = true
var mouseSensitivity = 0.0015

var AppID = "3045000"

var boardHandle : int
var leaderboard_handle

func _init():
	OS.set_environment("SteamAppID", AppID)
	OS.set_environment("SteamGameID", AppID)
	Steam.leaderboard_find_result.connect(_on_leaderboard_find_result)




func _ready():
	AudioServer.set_bus_volume_db(audioBus, -30)
	Steam.steamInit()
	var isRunning = Steam.isSteamRunning()
	if !isRunning:
		print("Error: Steam not running")
		return
	print("Steam is running")

	var id = Steam.getSteamID()
	var name = Steam.getFriendPersonaName(id)
	print(name)

func _process(delta):
	Steam.run_callbacks()

func _LoadLeaderboard():
	Steam.findLeaderboard(sceneName)

func _physics_process(delta):
	totalTime += delta
	roundTime += delta

func _MapFinished():

	Steam.uploadLeaderboardScore(roundTime * 1000)
	mapTimes[sceneName] = roundTime
	print(mapTimes)

func _ResetPlatforms():
	totalTime += showPlatformTime
	roundTime += showPlatformTime
	addTime.emit()
	resetPlatforms.emit()

func _SetAchievement(ACH):
	var status = Steam.getAchievement(ACH)
	if status["achieved"]:
		print("Already Unlocked")
		return
	Steam.setAchievement(ACH)
	print("UnlockedAchievement " + ACH)

func leaderboard_result(handle: int, found: int) -> void:
	print("called")
	if found:
		boardHandle = handle
		print("Leaderboard found!")
	else:
		print("Leaderboard not found!")
		
func _on_leaderboard_find_result(handle: int, found: int) -> void:
	if found == 1:
		leaderboard_handle = handle
		print("Leaderboard handle found: %s" % leaderboard_handle)
	else:
		print("No handle was found")
