extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../Players".get_children().size() == 1:
		self.show()
		$RichTextLabel.text = "Player " + str($"../Players".get_child(0).playerId) + " Wins!"
		get_tree().paused = true
	elif $"../Players".get_children().size() < 1:
		self.show()
		$RichTextLabel.text = "No one wins!"
		get_tree().paused = true
	pass

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.
