extends Node3D

@export var nextLevel = "octopusGame"
var rotationSpeed = 2
@export var isFinalOfSet = false
@export var isFinalLevel = false
#Set on final level of the set only
@export var setname = ""

func _ready():
	Manager.isFinalOfSet = isFinalOfSet
	Manager.isFinalLevel = isFinalLevel
	if(isFinalOfSet):
		Manager._LoadLeaderboard(setname)
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
			call_deferred("_nextScene")
		
func _nextScene():
	Manager.scene_file_path = nextLevel
	var sceneNameStrings = nextLevel.split("/")
	print(sceneNameStrings)	
	Manager.sceneName = sceneNameStrings[sceneNameStrings.size()-1]
	get_tree().change_scene_to_file("res://Worlds/" + nextLevel + ".tscn")	
	#Manager._LoadLeaderboard(Manager.sceneName)
