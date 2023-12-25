class_name StabilizarShootComponent
extends Node

signal overload
signal overload_finish
signal shoot_stable

@export var heat_capacity: int = 500

@export var heat_applied_by_shoot: int = 100

@export var heat_decrease_over_time: int = 10

@export var overload_time: float = 2.0

@export var shoot_position: Node2D = null

var cur_heat: int = 0
var overloading: bool = false

@onready var overload_timer: Timer = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	overload_timer.timeout.connect(_on_overload_timeout)
	add_child(overload_timer)


func _physics_process(delta) -> void:
	cur_heat -= heat_decrease_over_time * delta
	cur_heat = max(cur_heat, 0)
	#print(cur_heat)

	if Input.is_action_just_pressed("shoot"):
		var can_shoot: bool = apply_heat()
		if can_shoot:
			shoot_stable.emit()


func _on_overload_timeout() -> void:
	overloading = false
	overload_finish.emit()


func apply_heat() -> bool:
	if overloading:
		return false

	cur_heat += heat_applied_by_shoot
	cur_heat = min(cur_heat, heat_capacity)

	if cur_heat == heat_capacity:
		overloading = true
		overload.emit()
		overload_timer.start(overload_time)

		return false

	return true
