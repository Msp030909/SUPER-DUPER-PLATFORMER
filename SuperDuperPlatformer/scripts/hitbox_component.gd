extends Area2D
class_name hitboxComponent

@export var stompDamage: float
@export var health_component: HealthComponent
enum damage_types { CONTACT, WEAPON}
@export var damage_type: damage_types
signal attacked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: CharacterBody2D) -> void:
	health_component.damage(stompDamage,"stomped")
	pass # Replace with function body.
	
	
func on_attack(damage, knockback):
	health_component.damage(damage, "dead")
	print("you forgot to set the damage type silly")
	if get_parent().has_method("on_attack"):
		attacked.connect(get_parent().on_attack)
		attacked.emit(knockback)
		attacked.disconnect(get_parent().on_attack)
		
	
			
