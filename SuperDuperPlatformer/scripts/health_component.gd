class_name HealthComponent

extends Node2D
@export var MAX_HEALTH := 10.0
@export var animatedSprite2D := AnimatedSprite2D

var health : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(attack,anim):
	health -= attack
	
	if health <= 0:
		animatedSprite2D.animation = str(anim)
		if "dying" in get_parent():
			get_parent().dying = true
			print("dying is true now")
		await get_tree().create_timer(5).timeout
		queue_free()
