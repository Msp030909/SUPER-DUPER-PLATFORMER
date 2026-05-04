extends Node2D
class_name moveComponent
var timer = 0
var estimatedPos = 0
@onready var player = $"../../Player"
@onready var newPos = get_parent().position.x

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(newPos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var maxTimer = 2
	if timer >= maxTimer:
		print("player position updated")
		estimatedPos = player.position.x 
		timer = 0	
	newPos = move_toward(get_parent().position.x,estimatedPos,1)
	timer += 1 * delta
	pass
