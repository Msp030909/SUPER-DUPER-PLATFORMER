extends CharacterBody2D
@onready var rayCast: RayCast2D = $RayCast2D
@export var direction := 1
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("I LIVE")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rayCast.is_colliding() == true:
		if rayCast.get_collider() is not CharacterBody2D:
			direction = -direction
			print("direction should be switched now")
			print(direction)
			rayCast.scale *= -1
			$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	if is_on_floor():
		position -= Vector2(speed * direction,0)
	elif not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()
	pass
