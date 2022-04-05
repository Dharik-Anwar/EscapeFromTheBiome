tool
extends Button

onready var anim_player: AnimationPlayer 
export(String, FILE) var next_scene: = ""


func _on_button_up() -> void:
	get_tree().change_scene(next_scene)
	get_tree().paused = 0
	PlayerData.reset()


func _get_configuration_warning() -> String:
	return "The next_scene must be set for button to work" if next_scene == "" else ""


