extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		PlayerData.HP += 50
		queue_free()
