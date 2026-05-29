extends Node2D
@export var playerCount := 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.checkpoint = Vector2(0,-10)
	$UI2.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
