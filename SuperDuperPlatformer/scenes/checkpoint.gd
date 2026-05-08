extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Player) -> void:
	Global.checkpoint = Vector2(global_position.x,global_position.y)
	print(Global.checkpoint)
	pass # Replace with function body.
