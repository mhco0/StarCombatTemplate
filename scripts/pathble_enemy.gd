class_name PathbleEnemy extends Enemy

@export var path_follow: PathFollow2D = null

var paths_resources: Array[Resource] = [
	preload("res://resources/paths/smooth_teeth.tres"),
	preload("res://resources/paths/straight.tres"),
	preload("res://resources/paths/teeth.tres"),
	preload("res://resources/paths/smooth_turn.tres")
]


func _ready():
	randomize()
	path_follow.get_parent().curve = paths_resources[randi() % paths_resources.size()]


func _physics_process(delta):
	if path_follow == null:
		return

	path_follow.progress += speed * delta

	if global_position.x < 0:
		path_follow.get_parent().queue_free()
