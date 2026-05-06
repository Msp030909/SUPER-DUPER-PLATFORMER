extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var angleFinder: angleFinder = $AngleFinder
@export var damage: int
@export var knockback: int


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = $MoveComponent.newVel
	match angleFinder.dir:
			"forwards":
				$AttackComponent.scale.x = 1
				$AttackComponent.attack(damage, knockback)
			"backwards":
				$AttackComponent.scale.x = -1
				$AttackComponent.attack(damage, knockback)
			"upwards":
				$AttackComponent2.scale.y = 1
				$AttackComponent2.attack(damage,knockback)
			"downwards":
				$AttackComponent2.scale.y = -1
				$AttackComponent2.attack(damage,knockback)
	move_and_slide()
	
