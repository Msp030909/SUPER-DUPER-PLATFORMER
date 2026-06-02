extends Area2D
class_name Portal
@export var destination: Portal
@export var dir: int
var justTped = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if justTped == true:
		await get_tree().create_timer(1)
		justTped = false
	pass


func _on_body_entered(body: ArenaPlayer) -> void:
	
	if justTped != true:
		body.position.x = destination.position.x + 20 * dir
		destination.justTped = true
	pass # Replace with function body.
