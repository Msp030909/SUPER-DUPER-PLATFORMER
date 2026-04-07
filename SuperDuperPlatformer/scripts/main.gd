extends Node2D
var canDialog:= false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_node("CanvasLayer"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func _on_player_npc_prox():
	canDialog = true
	pass
	
