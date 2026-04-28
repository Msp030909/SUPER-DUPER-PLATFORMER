extends Node2D
var ypos
var xpos
enum angles { LEFT, RIGHT, UP, DOWN }

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var angle = atan2(get_global_mouse_position().y,get_global_mouse_position().x)
	rotation = angle
	if get_angle_to(get_global_mouse_position()) <= 0:
		ypos = true
	else:
		ypos = false
	var rangle = round(angle)
	print(rangle)
	if rangle >= 0 and rangle <= 1:
		print("forwards")
	elif rangle <= -1 and rangle >= -2:
		print("up")
	elif rangle >= 1 or rangle <= -3:
		print("back")
	pass
