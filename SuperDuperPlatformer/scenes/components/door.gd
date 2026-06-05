extends StaticBody2D
@export var requirement: Array[CharacterBody2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !requirement.any(func(item): return is_instance_valid(item)):
		queue_free()
	pass
