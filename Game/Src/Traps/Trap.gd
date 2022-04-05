extends KinematicBody2D


export var gravity: = 0.0
var velocity: = Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)


func _on_TrapDetector_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		gravity = 4000.0
	if body.collision_layer == 64 or body.collision_layer == 8:
		collision_layer = 8


func _on_TD1_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		gravity = 4000.0
	elif body.collision_layer == 64 :
		gravity = 0.0
		body.collision_layer = 8
		velocity = Vector2.ZERO


func _on_TD2_body_entered(body: Node) -> void:
	if body.collision_layer == 1:
		gravity = 4000.0
	elif body.collision_layer == 64 :
		gravity = 0.0
		body.collision_layer = 8
		velocity = Vector2.ZERO
