extends Node
@onready var audioBus := AudioServer.get_bus_index("Master")
var sceneName = "tutorial"
var scenePath = "tutorial"

enum GAME_MODES{LEVEL, SET, GAUNTLET}

var gameMode = GAME_MODES.LEVEL

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

var paused = false

var finalRoundTime = 0
var finalSetTime = 0

var isFinalOfSet
var isFinalLevel

func _init():
	OS.set_environment("SteamAppID", AppID)
	OS.set_environment("SteamGameID", AppID)
	Steam.leaderboard_find_result.connect(_on_leaderboard_find_result)
	Steam.leaderboard_scores_downloaded.connect(_on_leaderboard_downloaded)




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
	Steam.findLeaderboard("Set1")

func _process(delta):
	Steam.run_callbacks()

func _LoadLeaderboard(leaderboardName):
	Steam.findLeaderboard(leaderboardName)


func _physics_process(delta):
	totalTime += delta
	roundTime += delta

func _MapFinished(isFinalOfSet, isFinalMap, SetName):
	finalRoundTime = roundTime
	if not isFinalOfSet:
		Steam.uploadLeaderboardScore(roundTime * 1000)
	if gameMode == GAME_MODES.LEVEL:
		_GetLeaderboardResults()
	elif gameMode == GAME_MODES.SET && isFinalOfSet:
		finalSetTime = totalTime
		print(SetName)
		Steam.uploadLeaderboardScore(finalSetTime * 1000)
		print("Cool you finished a set")
		_GetLeaderboardResults()
	elif gameMode == GAME_MODES.GAUNTLET && isFinalLevel:
		finalSetTime = totalTime
		Steam.uploadLeaderboardScore(finalSetTime * 1000)
		_GetLeaderboardResults()
	mapTimes[sceneName] = roundTime

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
		
func _GetLeaderboardResults():
	Steam.downloadLeaderboardEntries(1, 10)
		
func _on_leaderboard_downloaded(message, handle, result):
	Ui._ShowHighscores(result)
	#for r in result:
	#	var name = Steam.getFriendPersonaName(r["steam_id"])
	#	var score = r["score"]
	#	print(name + " Score : " + str(score))
