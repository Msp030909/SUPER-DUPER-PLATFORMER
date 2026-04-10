extends Node2D
@onready var canvas: CanvasLayer = $"../CanvasLayer"
@export var dialog: Array[String]
var emptyDialog: Array[String]
signal playerNear(words)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(canvas)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_entered(body: CharacterBody2D) -> void:
	playerNear.connect(canvas.on_player_npc_prox)
	playerNear.emit(dialog)
	pass # Replace with function body.


func _on_player_exited(body: CharacterBody2D) -> void:
	playerNear.emit(emptyDialog)
	playerNear.disconnect(canvas.on_player_npc_prox)
	pass # Replace with function body.
