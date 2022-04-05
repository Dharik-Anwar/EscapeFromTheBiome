extends Actor
class_name Enemy

var score: int
var HP_enemy: int

var Bullet: = 50

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x
	

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	

func kill() -> void:
	PlayerData.score += score
	queue_free()
	
