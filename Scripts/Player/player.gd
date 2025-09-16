class_name Player
extends CharacterBody2D

var current_state: State

@onready
var sprite: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	current_state = PlayerStates.Idle.new()
	current_state.parent = self
	current_state.enter()

func change_states(new_state: State) -> void:
	current_state.exit()
	current_state = new_state
	current_state.parent = self
	current_state.enter()

func _process(delta: float) -> void:
	current_state.frame(delta)
	
	var new_state = current_state.state()
	if new_state:
		change_states(new_state)

func _physics_process(delta: float) -> void:
	current_state.phys(delta)
	
	move_and_slide()
