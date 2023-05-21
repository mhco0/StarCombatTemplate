class_name Enemy
extends Area2D

@export
var speed: int = 400

@export
var damage_done: int = 1

var velocity: Vector2 = Vector2(0, 0)

func _ready():
	velocity = Vector2(-speed, 0)

func _physics_process(delta):
	position += velocity * delta
	
	if (position.x <= 0):
		queue_free()
