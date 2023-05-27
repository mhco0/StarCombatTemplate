extends Control

@export 
var player_health: Health

@onready
var pause_label: Label = $PauseLabel

@onready
var animation_player: AnimationPlayer = $AnimationPlayer

@onready 
var back_button: Button = $BackButton

func _ready():
	back_button.button_down.connect(_on_back_button_pressed)
	player_health.death.connect(_on_game_over)

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		pause_label.visible = not pause_label.visible
		back_button.visible = not back_button.visible
		get_tree().paused = not get_tree().paused

func _on_game_over():
	get_tree().paused = true
	animation_player.play("game_over")

func _on_back_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/home_ui.tscn")
