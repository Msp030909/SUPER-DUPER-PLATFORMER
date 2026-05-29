extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_play_pressed() -> void:
	if Global.level:
		get_tree().change_scene_to_file("res://scenes/levels/level" + var_to_str(Global.level) + ".tscn")
	else:
		Global.level = 1
		get_tree().change_scene_to_file("res://scenes/levels/level" + var_to_str(Global.level) + ".tscn")
	print("trying to do stuff")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass # Replace with function body.


func _on_arena_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/arena.tscn")
	pass # Replace with function body.


func _on_arena_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/arena2p.tscn")
	pass # Replace with function body.
