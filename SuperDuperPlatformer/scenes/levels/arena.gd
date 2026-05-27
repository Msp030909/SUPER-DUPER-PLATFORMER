extends Node2D
@export var playerCount := 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for player in playerCount:
		var playerBody = preload("res://scenes/player/arenaplayer.tscn").instantiate()
		playerBody.$MeshInstance.
		add_child(playerBody)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
