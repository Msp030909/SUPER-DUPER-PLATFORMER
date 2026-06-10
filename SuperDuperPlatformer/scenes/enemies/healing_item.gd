extends Node2D
@export var heal: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_component_area_entered(area: hitboxComponent) -> void:
	if area.get_parent() is Player or ArenaPlayer:
		await $AttackComponent.attack(-heal,0)
		queue_free()
	pass # Replace with function body.
