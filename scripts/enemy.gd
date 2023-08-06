class_name Enemy
extends Area2D

@export
var speed: int = 20

@export
var progress_on_path: float = 0.02

@export
var damage_done: int = 1

@onready
var path_follow: PathFollow2D = $Path2D/PathFollow2D

@onready
var path_mark: Marker2D = $Path2D/PathFollow2D/Marker2D

var progress_ratio: float = speed * progress_on_path

func _ready():
	path_follow.progress_ratio = progress_ratio

func _physics_process(delta):
	#position += velocity * delta
	self.position = path_mark.global_position
	
	if (position.x <= 0):
		queue_free()
