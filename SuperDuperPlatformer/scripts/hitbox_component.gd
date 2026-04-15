extends Area2D
class_name hitboxComponent

@export var stompDamage: float
@export var health_component: HealthComponent
enum damage_types { CONTACT, WEAPON}
@export var damage_type: damage_types
@export var knockbackAffected: bool
#@export var knockback: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: CharacterBody2D) -> void:
	print("I'm doin this")
	match damage_type:
		damage_types.CONTACT: 
			health_component.damage(stompDamage,"stomped")
		_:
			print("no damage type")
	pass # Replace with function body.
	
	
func on_attack(damage, knockback):
	health_component.damage(damage, "dead")
	if knockbackAffected == true:
			get_parent().velocity = Vector2.ZERO
			get_parent().position.x += knockback
			get_parent().move_and_slide()
		
	
			
