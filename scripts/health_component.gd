class_name Health
extends Node

signal health_change(new_health)
signal death

@export var m_health: int = 3


func take_damage(amount: int) -> void:
	m_health -= amount
	health_change.emit(m_health)

	if m_health <= 0:
		death.emit()


func heal(amount: int) -> void:
	m_health += amount

	health_change.emit(m_health)


func is_dead() -> bool:
	return m_health <= 0
