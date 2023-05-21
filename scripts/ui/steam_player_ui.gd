extends Control

@onready
var player_avatar: TextureRect = $HBoxContainer/PlayerAvatar

@onready
var player_name: Label = $HBoxContainer/VBoxContainer/PlayerName

@onready
var player_lvl: Label = $HBoxContainer/VBoxContainer/PlayerLvl

# Called when the node enters the scene tree for the first time.
func _ready():
	if(SteamSingleton.is_online):
		Steam.avatar_loaded.connect(_on_avatar_loaded)
		print(SteamSingleton.steam_id)
		Steam.getPlayerAvatar(Steam.AVATAR_MEDIUM, SteamSingleton.steam_id)
		print(SteamSingleton.steam_nick)
		player_name.text = SteamSingleton.steam_nick
		player_lvl.text = "Level " + str(SteamSingleton.steam_lvl)
	else:
		visible = false
	
func _on_avatar_loaded(id: int, size: int, buffer: PackedByteArray) -> void:
	var avatar: Image = Image.create_from_data(size, size, false, Image.FORMAT_RGBA8, buffer)
	var avatar_texture: ImageTexture = ImageTexture.create_from_image(avatar)
	player_avatar.set_texture(avatar_texture)
	


