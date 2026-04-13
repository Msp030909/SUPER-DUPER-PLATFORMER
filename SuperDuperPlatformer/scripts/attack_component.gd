extends Area2D
@export var sprites: AnimatedSprite2D
var atk_cooldown: float
signal attack_node
var recipient

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func attack(damage, knockback):
	#print("attack registered but no recipient")
	if sprites:
			sprites.play("attack")
	if recipient:
		#print("attacking, there is a recipient")
		attack_node.connect(recipient.on_attack)
		attack_node.emit(damage, knockback * int(scale.x))
		attack_node.disconnect(recipient.on_attack)
		#print("attacking")
	
		pass


func _on_area_entered(area: hitboxComponent) -> void:
	recipient = area
	print(recipient)
	pass # Replace with function body.


func _on_area_exited(area: hitboxComponent) -> void:
	recipient = null
	pass # Replace with function body.
