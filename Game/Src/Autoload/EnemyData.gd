extends Node


signal HP_Spider_updated
signal HP_Bat_updated



var HP_Spider: int = 100 setget set_HP_Spider
var HP_Bat: int = 50 setget set_HP_Bat



func set_HP_Spider(value: int) -> void:
	HP_Spider = value
	emit_signal("HP_Spider_updated")


func set_HP_Bat(value: int) -> void:
	HP_Bat = value
	emit_signal("HP_Bat_updated")
