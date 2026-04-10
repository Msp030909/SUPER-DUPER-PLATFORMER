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
	if sprites:
		if sprites.animation_finished:
			sprites.animation = "idle"
	pass


func _on_body_entered(body: CharacterBody2D) -> void:
	#print(body)
	recipient = body
	print(recipient)
	pass # Replace with function body.


func _on_body_exited(body: CharacterBody2D) -> void:
	recipient = null
	pass # Replace with function body.
	
func attack(damage):
	print("attack registered but no recipient")
	if recipient:
		print("attacking, there is a recipient")
		if sprites:
			sprites.animation = "attack"
			print("we be changing animations")
		attack_node.connect(recipient.on_attack)
		attack_node.emit(damage)
		attack_node.disconnect(recipient.on_attack)
		print("attacking")
