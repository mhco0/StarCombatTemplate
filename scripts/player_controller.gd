class_name Player
extends Area2D

@export
var speed: int = 10

@export
var health_component: Health

@export
var score_component: Score

@export
var vulnerability_component: Vulnerability

@export
var sprite_component: Sprite2D

@export
var shoot_position: Node2D

@export
var animation_player: AnimationPlayer

@onready
var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn") as PackedScene

var velocity: Vector2 = Vector2(0, 0)
var limit_y: float = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	area_entered.connect(_on_area_entered)

func _physics_process(delta):
	
	if(Input.is_action_just_pressed("shoot")):
		spawn_bullet()
	
	velocity = get_input_vector() * speed
	
	position += velocity
	position.y = max(sprite_component.get_rect().size.y / 2, min(position.y, \
							limit_y - sprite_component.get_rect().size.y / 2))

func _on_enemy_kill() -> void:
	score_component.increase_score()

func _on_area_entered(area: Area2D) -> void:
	if(area is Enemy and vulnerability_component.vulnerable):
		health_component.take_damage(area.damage_done)
		vulnerability_component.vulnerable = false
		animation_player.play("invulnerability", -1, vulnerability_component.invulnerability_time)
		area.queue_free()

func spawn_bullet() -> void:
	var bullet: Area2D = bullet_scene.instantiate()
	bullet.position = shoot_position.global_position
	bullet.enemy_killed.connect(_on_enemy_kill)
	if(get_parent()):
		get_parent().add_child(bullet)
	else:
		get_window().add_child(bullet)

func get_input_vector() -> Vector2:
	return Vector2(0, int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
