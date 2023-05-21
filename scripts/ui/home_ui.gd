extends Control

@onready
var start_button: Button = $CenterContainer/VBoxContainer/StartButton

@onready
var exit_button: Button = $CenterContainer/VBoxContainer/ExitButton

func _ready():
	start_button.button_down.connect(_on_start_button_pressed)
	exit_button.button_down.connect(_on_exit_button_pressed)
	
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/level.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
