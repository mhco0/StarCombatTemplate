extends Node

# Steam variables
var is_owned: bool = false
var is_online: bool = false
var steam_id: int = 0
var steam_nick: String = ""
var steam_lvl: int = 0


func _ready() -> void:
	_initialize_Steam()


func _process(_delta: float) -> void:
	Steam.run_callbacks()


func _initialize_Steam() -> void:
	var init: Dictionary = Steam.steamInit()
	print("Did Steam initialize?: " + str(init))

	if init["status"] != 1:
		print("Failed to initialize Steam. " + str(init["verbal"]) + " Shutting down...")
		#get_tree().quit()

	is_online = Steam.loggedOn()
	steam_id = Steam.getSteamID()
	is_owned = Steam.isSubscribed()
	steam_nick = Steam.getPlayerNickname(steam_id)
	steam_lvl = Steam.getPlayerSteamLevel()
