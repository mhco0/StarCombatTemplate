extends HBoxContainer

@export
var score: Score

@onready
var score_board: Label = $Score

func _ready():
	score.score_changed.connect(_on_score_change)


func _on_score_change(new_score: int) -> void:
	score_board.text = str(new_score)

