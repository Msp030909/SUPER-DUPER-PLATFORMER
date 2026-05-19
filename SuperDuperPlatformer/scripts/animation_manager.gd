extends Node2D
class_name AnimationManager
@export var animSprite: AnimatedSprite2D
@export var atkComponent: attackComponent
var attacking

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var initAnim
	if get_parent().velocity.x >= 1:
		initAnim = "walk"
		animSprite.scale.x = -1.5
	elif get_parent().velocity.x <= 1:
		initAnim = "walk"
		animSprite.scale.x = 1.5
	else:
		initAnim = "idle"
	
	if attacking == true:
		animSprite.play(initAnim + "_slash")
		attacking = false
	else:
		await animSprite.animation_finished
		animSprite.play(initAnim)
	pass
