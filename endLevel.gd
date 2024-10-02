extends Node3D

@export var nextLevel = "octopusGame"
@export var nextLevelIfGauntlet = "Set1/Tutorial"
var rotationSpeed = 2
@export var isFinalOfSet = false
@export var isFinalLevel = false
#Set on final level of the set only
@export var setname = ""

func _ready():
	Manager.isFinalOfSet = isFinalOfSet
	Manager.isFinalLevel = isFinalLevel
	if(isFinalOfSet and Manager.gameMode == Manager.GAME_MODES.SET):
		Manager._LoadLeaderboard(setname)
	elif (Manager.gameMode == Manager.GAME_MODES.GAUNTLET && isFinalOfSet):
		if(isFinalLevel):
			Manager._LoadLeaderboard("Gauntlet")
	else:
		Manager._LoadLeaderboard(Manager.sceneName)
	Manager.paused = false
	Ui.endLevel = self

func _process(delta):
	self.rotation.y += rotationSpeed * delta

func _on_gem_body_entered(body):
	if body.is_in_group("player"):
		WinSound.play()
		var map = get_parent()
		print(map.name)
		
		if Ui.GoldTime > Manager.roundTime:
			var ACH = "ACH_FirstGold"
			Manager._SetAchievement(ACH)
		
		Manager._MapFinished(isFinalOfSet, isFinalLevel, setname)
		Manager.paused = true
		if Manager.gameMode == Manager.GAME_MODES.SET && not isFinalOfSet:
			call_deferred("_nextScene")
		if Manager.gameMode == Manager.GAME_MODES.GAUNTLET:
			if(isFinalLevel && Manager.leaderboard_handle):
				pass
				#get_tree().change_scene_to_file("res://Worlds/title.tscn")
			else:
				call_deferred("_nextScene")
		
func _nextScene():
	if (Manager.gameMode == Manager.GAME_MODES.GAUNTLET && isFinalOfSet):
		if(isFinalLevel):
			get_tree().change_scene_to_file("res://Worlds/title.tscn")
		Manager.scene_file_path = nextLevelIfGauntlet
		var sceneNameStrings = nextLevelIfGauntlet.split("/")
		print(sceneNameStrings)	
		Manager.sceneName = sceneNameStrings[sceneNameStrings.size()-1]
		get_tree().change_scene_to_file("res://Worlds/" + nextLevelIfGauntlet + ".tscn")	
	else:
		Manager.scene_file_path = nextLevel
		var sceneNameStrings = nextLevel.split("/")
		print(sceneNameStrings)	
		Manager.sceneName = sceneNameStrings[sceneNameStrings.size()-1]
		get_tree().change_scene_to_file("res://Worlds/" + nextLevel + ".tscn")	
	#Manager._LoadLeaderboard(Manager.sceneName)
