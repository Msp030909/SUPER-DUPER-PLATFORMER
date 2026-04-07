extends Node2D
var canDialog:= false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dialogue") and canDialog == true:
		get_node("res://scenes/hud.tscn").instantiate()
		print("this is doing stuff")
	pass

func _on_player_npc_prox():
	canDialog = true
	pass
	
