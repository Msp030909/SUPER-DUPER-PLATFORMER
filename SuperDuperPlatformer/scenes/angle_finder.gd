extends Node2D
var ypos
var xpos
var dir
enum angles { FORWARD, BACKWARD, UP, DOWN }

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var angle = atan2(get_global_mouse_position().y,get_global_mouse_position().x)
	rotation = lerp_angle(angle,rotation, delta)
	var rangle = round(angle)
	print(rangle)
	if rangle == 0:
		dir = angles.FORWARD
		print("forwards")
	elif rangle <= -1 and rangle >= -2:
		dir = angles.UP
		print("up")
	elif rangle >= 3 or rangle <= -3:
		dir = angles.BACKWARD
		print("back")
	else:
		dir = angles.DOWN
		print("down")
	pass
