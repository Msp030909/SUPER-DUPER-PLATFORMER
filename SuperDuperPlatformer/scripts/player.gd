extends CharacterBody2D

const SPEED = 10000.0
const JUMP_VELOCITY = -300.0

var invulnerable := false
var health = 100

func handle_movement(delta: float) -> void:
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("moveL", "moveR")
	if direction:
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	if invulnerable == true:
		$Timer.start()
	pass


func _physics_process(delta: float) -> void:
	handle_movement(delta)
	pass
	
func deal_damage(damage, knockback):
	if invulnerable != true:
		health -= damage
		position.x -= knockback
		print("this is the health now: ", health)
		print(knockback)
		invulnerable = true


func _on_timer_timeout() -> void:
	invulnerable = false
	print("time up")
	pass # Replace with function body.
