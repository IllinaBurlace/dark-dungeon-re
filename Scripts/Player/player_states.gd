class_name PlayerStates
extends Node

class Idle:
	extends State
	
	func enter() -> void:
		parent.sprite.play("Idle")
		parent.velocity = Vector2.ZERO
	
	func state() -> State:
		if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2.ZERO:
			return Move.new()
		return null

class Move:
	extends State
	
	func phys(delta: float) -> void:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
		parent.velocity = direction * 300.0
	
	func state() -> State:
		if Input.get_vector("move_left", "move_right", "move_up", "move_down") == Vector2.ZERO:
			return Idle.new()
		return null
