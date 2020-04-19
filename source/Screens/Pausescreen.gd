extends Control

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_ButtonReturn_pressed() -> void:
	get_tree().paused = false
	visible = false
