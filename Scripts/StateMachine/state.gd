@abstract
class_name State
extends Node

var parent: Player

func frame(delta: float) -> void:
	pass

func phys(delta: float) -> void:
	pass

func state() -> State:
	return null

func enter() -> void:
	pass

func exit() -> void:
	pass
