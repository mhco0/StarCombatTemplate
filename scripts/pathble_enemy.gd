class_name PathbleEnemy extends Enemy

@export var path_follow: PathFollow2D = null

func _physics_process(delta):
	if path_follow == null:
		return

	path_follow.progress += speed * delta

	if global_position.x <= 0:
		path_follow.get_parent().queue_free()