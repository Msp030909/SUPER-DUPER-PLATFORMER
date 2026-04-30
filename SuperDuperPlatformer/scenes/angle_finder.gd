extends Node2D
var ypos
var xpos
var dir: String
enum angles { FORWARD, BACKWARD, UP, DOWN }
@export var trackPlayer := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var angle = global_rotation_degrees
	if trackPlayer != true:
		look_at(get_global_mouse_position())
	else:
		look_at($"../../Player".global_position)
	#rotation = lerp_angle(rotation,angle, delta)
	var rangle = round(angle)
	#print(rangle)
	if rangle >= -30 and rangle <= 30:
		dir = "forwards"
		#print("forwards")
	elif rangle <= -41 and rangle >= -133:
		dir = "up"
		#print("up")
	elif rangle <= 31 or rangle >= 120:
		dir = "backwards"
		#print("back")
	else:
		dir = "down"
		#print("down")
	pass
