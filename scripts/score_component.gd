class_name Score
extends Node

signal score_changed(new_score)

@export
var m_score: int = 0

func increase_score() -> void:
	m_score += 1
	score_changed.emit(m_score)
