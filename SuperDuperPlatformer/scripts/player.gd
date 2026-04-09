extends CharacterBody2D

const SPEED = 10000.0
const JUMP_VELOCITY = -300.0

var inv_timer: float= 1
var invulnerable := false
var alr_inv := false
var health = 100

func _physics_process(delta: float) -> void:
	handle_movement(delta)
	invulnerability(delta)
	pass

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
	
	pass
	
func invulnerability(delta:float) -> void:
	if invulnerable == true:
		inv_timer -= 1 * delta
		#print(inv_timer)
		self.modulate = Color.YELLOW
	if inv_timer <= 0:
		invulnerable = false
		inv_timer = 1
		print("time up")
		self.modulate = Color.WHITE
	pass

func deal_damage(damage, knockback):
	if invulnerable != true:
		health -= damage
		position.x -= knockback
		print("this is the health now: ", health)
		print(knockback)
		invulnerable = true
