extends Node2D
class_name moveComponent
var timer = 0
var estimatedPos = 0
@export var angleFinder: angleFinder
@onready var player = $"../../Player"
@onready var newVel = 0
@export var velSpeed: int
@export var JUMPVEL: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var maxTimer = 1
	if timer >= maxTimer:
		match angleFinder.xdir:
			"forwards":
				newVel = 1 * velSpeed
			"backwards":
				newVel = -1 * velSpeed
			_:
				newVel = 0
		if angleFinder.dir == "upwards":
			jump()
			print("jumping")
		timer = 0
		print("updating pos")
		
	timer += 1 * delta
	pass
	
func jump():
	get_parent().velocity.y = -JUMPVEL
