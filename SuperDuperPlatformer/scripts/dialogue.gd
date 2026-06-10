extends Control


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

func _on_settings_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/misc/title.tscn")
	pass # Replace with function body.


func _on_resume_pressed() -> void:
	get_tree().paused = false
	queue_free()
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_on_resume_pressed()
