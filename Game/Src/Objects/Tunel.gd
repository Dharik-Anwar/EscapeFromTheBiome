extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var teleport_position: Vector2


func _on_Tunel_body_entered(body: Node) -> void:
	teleport(body)


func teleport(body: Node) -> void:
	anim_player.play("fade_in")
	#yield(anim_player, "animation_finished")
	body.position = teleport_position

