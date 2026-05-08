extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: hitboxComponent) -> void:
	if area.get_parent() is Player:
		area.get_parent().position = Global.checkpoint
	else:
		area.get_parent().queue_free()
	pass # Replace with function body.
