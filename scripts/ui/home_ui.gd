extends Control

@onready
var start_button: Button = $CenterContainer/VBoxContainer/StartButton

@onready
var options_button: Button = $CenterContainer/VBoxContainer/OptionsButton

@onready
var exit_button: Button = $CenterContainer/VBoxContainer/ExitButton

func _ready():
	start_button.button_down.connect(_on_start_button_pressed)
	options_button.button_down.connect(_on_options_button_pressed)
	exit_button.button_down.connect(_on_exit_button_pressed)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/settings_ui.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
