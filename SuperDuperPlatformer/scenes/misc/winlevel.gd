extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: hitboxComponent) -> void:
	if area.get_parent() is Player:
		if FileAccess.get_file_as_string("res://scenes/levels/level" + var_to_str(Global.level + 1) + ".tscn"):
			Global.level += 1
			get_tree().change_scene_to_file("res://scenes/levels/level" + var_to_str(Global.level) + ".tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/misc/title.tscn")
	pass # Replace with function body.
