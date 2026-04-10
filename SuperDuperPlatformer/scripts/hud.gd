extends CanvasLayer
var canDialog: bool
var storedDialog: Array[String]
var inDialog: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("I'm here by the way")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dialogue") and canDialog == true and inDialog != true and storedDialog.size() >= 1:
		start_dialog();
		inDialog = true
	pass

func on_player_npc_prox(dialog):
	canDialog = true
	storedDialog = dialog
	#print(dialog, " this is the dialogue btw")

func start_dialog():
	var hud = preload("res://scenes/hud.tscn")
	var child_hud = hud.instantiate()
	child_hud.dialog = storedDialog
	add_child(child_hud)
	#print("this is doing stuff")
	pass

func on_dialog_done():
	inDialog = false
	canDialog = false
	storedDialog = []
