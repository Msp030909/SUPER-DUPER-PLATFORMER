extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var angleFinder: angleFinder = $AngleFinder
@export var damage: int
@export var knockback: int
var ogPos: Vector2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = $MoveComponent.newVel
	
	weapon_aimer()
	
	if $RayCast2D.is_colliding() == true :
		if $RayCast2D.get_collider() is not CharacterBody2D:
			$MoveComponent.jump()
			print("jumping")
	elif $RayCast2D2.is_colliding() == true:
		if $RayCast2D2.get_collider() is not CharacterBody2D:
			$MoveComponent.jump()
			print("jumping")
	move_and_slide()

func weapon_aimer():
	match angleFinder.dir:
			"forwards":
				$AttackComponent.scale.x = 1
				#$AttackComponent.attack(damage, knockback)
			"backwards":
				$AttackComponent.scale.x = -1
				#$AttackComponent.attack(damage, knockback)
			"upwards":
				$AttackComponent2.scale.y = 1
				#$AttackComponent2.attack(damage,knockback)
			"downwards":
				$AttackComponent2.scale.y = -1
				#$AttackComponent2.attack(damage,knockback)
	pass

func _on_attack_component_area_entered(area: hitboxComponent) -> void:
	$AttackComponent.recipient = area
	$AttackComponent.attack(damage, knockback)
	pass # Replace with function body.


func _on_attack_component_2_area_entered(area: hitboxComponent) -> void:
	$AttackComponent2.recipient = area
	$AttackComponent2.attack(damage, knockback)
	pass # Replace with function body.


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	position = ogPos
	pass # Replace with function body.


func _on_ready() -> void:
	ogPos = position
	pass # Replace with function body.
