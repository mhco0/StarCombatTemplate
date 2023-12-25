@tool
extends Node2D

@export var spawn_father: Node2D

@export var area: Rect2

@onready var timer: Timer = $Timer

var enemy_scenes: Array[PackedScene] = [
	preload("res://scenes/pathble_enemy.tscn"),
	preload("res://scenes/enemy.tscn"),
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	draw.emit()
	timer.timeout.connect(spawn_enemy)


func _draw() -> void:
	draw_rect(area, Color(0.4, 0.4, 0.4, 0.5))


func spawn_enemy() -> void:
	var enemy_scene: PackedScene = enemy_scenes[randi() % enemy_scenes.size()] as PackedScene
	var enemy = enemy_scene.instantiate()
	spawn_father.add_child(enemy)
	var random_x: int = randi_range(global_position.x, global_position.x + area.size.x)
	var random_y: int = randi_range(global_position.y, global_position.y + area.size.y)
	enemy.global_position = Vector2(random_x, random_y)
