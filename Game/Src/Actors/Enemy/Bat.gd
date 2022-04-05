extends Enemy


onready var anim_sprite: AnimatedSprite = get_node("bat")


func _ready() -> void:
	velocity.y = 0
	score = 20
	HP_enemy = EnemyData.HP_Bat


func _physics_process(delta: float) -> void:
	velocity.y = 0
	if velocity.x < 0:
		anim_sprite.flip_h = false
	if velocity.x > 0:
		anim_sprite.flip_h = true


func _on_KillDetector_area_entered(area: Area2D) -> void:
	
	if area.collision_layer == 16 and HP_enemy > 0 :
		velocity.x *= -1.0
		HP_enemy -= Bullet
	if area.collision_layer == 16 and HP_enemy <=0:
		kill()


func _on_KillDetector_body_entered(body: Node) -> void:
	if body.collision_layer == 64:
		queue_free()
