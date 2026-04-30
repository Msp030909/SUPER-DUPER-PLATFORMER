extends Area2D
class_name attackComponent
@export var sprites: AnimatedSprite2D
var atk_cooldown: float
@export var MAX_CD: float
signal attack_node
var recipient

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if atk_cooldown:
		if atk_cooldown > 0:
			atk_cooldown -= 1 * delta
			
	pass
	
func attack(damage, knockback):
	#print("attack registered but no recipient")
	if atk_cooldown <= 0:
		if sprites:
				sprites.play("attack")
		if recipient:
			#print("attacking, there is a recipient")
			attack_node.connect(recipient.on_attack)
			attack_node.emit(damage, knockback * int(scale.x))
			attack_node.disconnect(recipient.on_attack)
			#print("attacking")
		atk_cooldown = MAX_CD
		pass


func _on_area_entered(area: hitboxComponent) -> void:
	recipient = area
	print(recipient)
	pass # Replace with function body.


func _on_area_exited(area: hitboxComponent) -> void:
	recipient = null
	pass # Replace with function body.
