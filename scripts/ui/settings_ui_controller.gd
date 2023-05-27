extends Control

@onready 
var back_button = $BackButton

func _ready():
	back_button.pressed.connect(_on_back_button_pressed)

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/home_ui.tscn")
