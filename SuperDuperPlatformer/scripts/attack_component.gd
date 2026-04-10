extends Area2D
@export var damage: float
var atk_cooldown: float
signal attack
var recipient: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		if recipient:
			print("trying to attack ", recipient)
			attack.connect(recipient.on_attack)
			attack.emit(damage)
			attack.disconnect(recipient.on_attack)
	pass


func _on_body_entered(body: CharacterBody2D) -> void:
	recipient = body
	
	pass # Replace with function body.


func _on_body_exited(body: CharacterBody2D) -> void:
	recipient = null
	pass # Replace with function body.
