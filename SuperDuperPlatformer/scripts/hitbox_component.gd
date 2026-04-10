extends Area2D
@export var damage: float
@export var health_component: HealthComponent
enum damage_types { CONTACT, WEAPON}
@export var damage_type: damage_types

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: CharacterBody2D) -> void:
	match damage_type:
		damage_types.CONTACT:
			health_component.damage(damage,"stomped")
		_:
			print("you forgot to set the damage type silly")
	pass # Replace with function body.
