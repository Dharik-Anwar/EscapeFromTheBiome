extends Node


signal score_updated
signal player_died
signal player_attacked
signal bullet_changed


var score: = 0 setget set_score
var death: = 0 setget set_death
var HP: = 200 setget set_HP
var No_of_bullets: = 10 setget set_bullet


func reset() -> void:
	score = 0
	death = 0
	HP = 200
	No_of_bullets = 10


func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")


func set_death(value: int) -> void:
	death = value
	emit_signal("player_died")


func set_HP(value: int) -> void:
	HP = value
	emit_signal("player_attacked")


func set_bullet(value: int) -> void:
	No_of_bullets = value
	emit_signal("bullet_changed")
