extends Node


func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_pressed() and event.unicode == KEY_R:
		get_tree().reload_current_scene()
