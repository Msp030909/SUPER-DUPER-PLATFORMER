class_name HealthComponent

extends Node2D
@export var MAX_HEALTH := 10.0
@export var animatedSprite2D := AnimatedSprite2D
@export var HAS_INV: bool
var invulnerable := false
var inv_timer: float
@export var MAX_INV: float


var deathcause

var health : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if HAS_INV: 
		invulnerability(delta)
	
	if health <= 0:
		if animatedSprite2D:
			animatedSprite2D.animation = str(deathcause)
		if "dying" in get_parent():
			get_parent().dying = true
			# print("dying is true now")
		await get_tree().create_timer(5).timeout
		get_parent().queue_free()
	pass

func damage(attack,anim):
	if invulnerable == false:
		health -= attack
		deathcause = anim
		print("this is the health now: ", health)
		if HAS_INV:
			invulnerable = true
	
	pass
	
func invulnerability(delta):
	if invulnerable == true:
		inv_timer -= 1 * delta
		#print(inv_timer)
		get_parent().modulate = Color.YELLOW
	if inv_timer <= 0:
		invulnerable = false
		inv_timer = MAX_INV
		#print("time up")
		get_parent().modulate = Color.WHITE
	pass
	
