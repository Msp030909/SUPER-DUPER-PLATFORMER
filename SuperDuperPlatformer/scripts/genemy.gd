class_name Enemy
extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Player"
@onready var rayCast: RayCast2D = $RayCast2D
@onready var playerDamagerL: RayCast2D = $PlayerDamagerL
@onready var playerDamagerR: RayCast2D = $PlayerDamagerR
@export var damage = 20
@export var knockback = 15
@export var direction := 1
var dying := false
signal dealDamage

func hurtPlayer(orientation):
		dealDamage.connect(player.deal_damage)
		dealDamage.emit(damage,knockback * orientation)
		dealDamage.disconnect(player.deal_damage)
		pass
