extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")
onready var audio_player: AudioStreamPlayer2D = get_node("collecting")
export var score: = 100



func _on_body_entered(body: Node) -> void:
	picked()


func picked() -> void:
	anim_player.play("Picked")
	audio_player.play()
	PlayerData.score += score
