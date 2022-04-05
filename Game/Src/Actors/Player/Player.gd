extends Actor


export var booster: = 1900.0
export var stomp_impulse: = 1000.0


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	if area.collision_layer == 512 : # booster
		velocity = calculate_stomp_velocity(velocity, booster)
	if area.collision_layer == 256:# and area.global_position.y > get_node(".").global_position.y:
		velocity = calculate_stomp_velocity(velocity, stomp_impulse)
	if area.collision_layer == 2:
		velocity = calculate_stomp_velocity(velocity, stomp_impulse)


func _on_EnemyDetector_body_entered(body: Node) -> void:
	
	if PlayerData.HP > 0 and body.collision_layer == 256: # silverfish
		PlayerData.HP -= 10
		
	if PlayerData.HP > 0 and body.collision_layer == 2: # enemy
		PlayerData.HP -= 40
		pass
	if PlayerData.HP > 0 and body.collision_layer == 64:#boluder
		PlayerData.HP -= 100
		body.collision_layer = 8
	if PlayerData.HP <= 0:
		die()
	


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction: = get_direction()
	
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		get_node("player").playing = true 
	
	
	if Input.is_action_just_pressed("move_right"):
		get_node("player").flip_h = false
		get_node("Bullet").global_rotation_degrees = 0
		get_node("Bullet").position.x = 21.5
		get_node("Target").position.x = 396.5
	
	
	elif Input.is_action_just_pressed("move_left"):
		get_node("player").flip_h = true
		get_node("Bullet").global_rotation_degrees = 180
		get_node("Bullet").position.x = -21.5
		get_node("Target").position.x = -396.5
	
	
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		get_node("player").playing = false
	
	velocity = move_and_slide(velocity, FLOOR_NORMAL)


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-Input.get_action_strength("jump") if is_on_floor() else 0.0
	)


func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	jump_interrupted: bool
) -> Vector2:
	
	var out = linear_velocity
	
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y += speed.y * direction.y
	if jump_interrupted:
		out.y = 0.0
	
	return out


func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out = linear_velocity
	out.y = -impulse
	return out


func die() -> void:
	PlayerData.death += 1
	PlayerData.HP = 0
	PlayerData.score = 0
	PlayerData.No_of_bullets =0
	queue_free()


