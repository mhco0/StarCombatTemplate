extends Area2D

signal enemy_killed

@export var speed: int = 450

@export var world_node: Node2D

var limit_x: float = ProjectSettings.get_setting("display/window/size/viewport_width")


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_some_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += delta * speed
	if global_position.x >= limit_x:
		queue_free()


func _on_some_area_entered(body: Area2D):
	body.queue_free()
	queue_free()
	enemy_killed.emit()
