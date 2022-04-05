extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready() -> void:
	get_node("CollisionShape2D").disabled = true


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("fire") and PlayerData.No_of_bullets > 0 :
		get_node("CollisionShape2D").disabled = false
		firing()


func firing() -> void:
	anim_player.playback_speed = 1
	if anim_player.play("Firing") == 0:
		anim_player.play("Firing")
	PlayerData.No_of_bullets -= 1


func _on_body_entered(body: Node) -> void:
	if body.collision_layer == 2:
		anim_player.playback_speed = 1000
	if body.collision_layer == 8:
		anim_player.playback_speed = 100
	get_node("CollisionShape2D").disabled = true
