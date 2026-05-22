extends Node2D
var spawnPoints: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		spawnPoints.append(child.position)
	print(spawnPoints)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
