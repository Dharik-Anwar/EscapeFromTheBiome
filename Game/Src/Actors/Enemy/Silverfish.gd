extends Enemy


onready var anim_sprite: AnimatedSprite = get_node("silverfish")

func _ready() -> void:
	score = 5


func _physics_process(delta: float) -> void:
	if velocity.x > 0:
		anim_sprite.flip_h = false
	if velocity.x < 0:
		anim_sprite.flip_h = true


func _on_StompDetector_body_entered(body: Node) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		pass
	get_node("CollisionShape2D").disabled = true
	if body.collision_layer == 1:
		kill()
	if body.collision_layer == 64:
		queue_free()
