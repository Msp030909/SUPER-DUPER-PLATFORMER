extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Player"
@onready var rayCast: RayCast2D = $RayCast2D
@onready var playerDamagerL: RayCast2D = $PlayerDamagerL
@onready var playerDamagerR: RayCast2D = $PlayerDamagerR
@export var damage = 20
@export var knockback = 15
@export var direction := 1

var already_collided: bool

signal dealDamage
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("I LIVE")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerDamagerL.is_colliding() == true and playerDamagerL.get_collider() is CharacterBody2D:
		if !already_collided:
			already_collided = true
			hurtPlayer(1)
		else:
			already_collided = false
	elif playerDamagerR.is_colliding() == true and playerDamagerR.get_collider() is CharacterBody2D:
		if !already_collided:
			already_collided = true
			hurtPlayer(-1)
		else:
			already_collided = false
		#this is NOT super optimized I don't like this very much but it's the simplest way to do collision
	if rayCast.is_colliding() == true:
		if rayCast.get_collider() is not CharacterBody2D:
			direction = -direction
			print("direction should be switched now")
			print(direction)
			rayCast.scale *= -1
			$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	if is_on_floor():
		position -= Vector2(speed * direction,0)
	else:
		velocity += get_gravity() * delta
	move_and_slide()
	pass
	
func hurtPlayer(orientation):
		dealDamage.connect(player.deal_damage)
		dealDamage.emit(damage,knockback * orientation)
		dealDamage.disconnect(player.deal_damage)
		pass
