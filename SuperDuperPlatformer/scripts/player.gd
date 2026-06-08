extends CharacterBody2D
class_name Player

@export var wepDamage: float
@export var wepKnockback: float
const SPEED = 200.0
const JUMP_VELOCITY = -300.0

var inv_timer: float= 1
var invulnerable := false
var alr_inv := false
@onready var health = $HealthComponent.health
@export var MAX_HEALTH_TIME := 10
var healthTimer = MAX_HEALTH_TIME
@export var healValue := 15
var dying = false

@export var COYOTE_TIME: float
var coyoteTimer: float

func _physics_process(delta: float) -> void:
	if dying == true:
		on_die()	
	Global.pHealth = $HealthComponent.health
	handle_movement(delta)
	invulnerability(delta)
	use_weapon()
	if $HealthComponent.healTimer >= 5:
		health_up(3)
	pass

func handle_movement(delta: float) -> void:
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		coyoteTimer += 1 * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and coyoteTimer <= COYOTE_TIME:
		velocity.y = JUMP_VELOCITY
		coyoteTimer = COYOTE_TIME
	if is_on_floor():
		coyoteTimer = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("moveL", "moveR")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	pass
	
func invulnerability(delta:float) -> void:

	pass

func deal_damage(damage, knockback):
	$HitboxComponent.on_attack(damage,knockback)
	print("I be doin this")
	pass

		
func use_weapon():
	var angleFinder = $AngleFinder
	if Input.is_action_just_pressed("action"):
		match angleFinder.dir:
			"forwards":
				$AttackComponent.scale.x = 1
				$AttackComponent.attack(wepDamage, wepKnockback)
			"backwards":
				$AttackComponent.scale.x = -1
				$AttackComponent.attack(wepDamage, wepKnockback)
			"upwards":
				$AttackComponent2.scale.y = 1
				$AttackComponent2.attack(wepDamage,wepKnockback)
			"downwards":
				$AttackComponent2.scale.y = -1
				$AttackComponent2.attack(wepDamage,wepKnockback)
		#$AttackComponent.attack(wepDamage, wepKnockback)
		#print("tryna attack")

func health_up(value):
	$HealthComponent.health += value * get_process_delta_time()
	if $HealthComponent.health == $HealthComponent.MAX_HEALTH:
		$HealthComponent.healTimer = 0
	pass

func on_die():
	get_tree().change_scene_to_file("res://scenes/misc/gameover.tscn")
	pass
