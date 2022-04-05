extends Area2D


func _on_TrapActivator_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		get_node(".").position.y -= 9.0
	


func _on_TA1_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		get_node(".").position.y -= 9.0


func _on_TA2_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		get_node(".").position.y -= 9.0

