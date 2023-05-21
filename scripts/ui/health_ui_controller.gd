extends HBoxContainer

@export 
var health_component: Health

@onready
var health_count: Label = $HealthCount

# Called when the node enters the scene tree for the first time.
func _ready():
	health_count.text = str(health_component.m_health)
	health_component.health_change.connect(_on_health_change)

func _on_health_change(new_health: int) -> void:
	health_count.text = str(new_health)
