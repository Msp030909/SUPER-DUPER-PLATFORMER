extends AnimatableBody2D
@onready var rayCast: RayCast2D = $RayCast2D
@export var direction := true
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("I LIVE")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rayCast.is_colliding() == true:
		if rayCast.get_collider() is not CharacterBody2D:
			direction = not direction
			print("direction should be switched now")
			print(direction)
			rayCast.scale *= -1
			$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	if direction == false:
		position += Vector2(speed,0)
	if direction == true:
		position -= Vector2(speed,0)
	pass
