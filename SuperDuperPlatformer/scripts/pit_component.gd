extends Area2D
@export var arena := false
signal arenaFell
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: hitboxComponent) -> void:
	area.get_parent().position = Global.checkpoint
	if arena == true:
		arenaFell.connect(area.get_parent()._on_fell)
		arenaFell.emit()
		arenaFell.disconnect(area.get_parent()._on_fell)

	pass # Replace with function body.
