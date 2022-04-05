extends Area2D



func _on_TrapActivator_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		queue_free()
