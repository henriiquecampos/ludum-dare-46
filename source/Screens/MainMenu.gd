extends Control

export (String, FILE, "*.tscn") var next_scene

func _on_ButtonStart_pressed() -> void:
	get_tree().change_scene(next_scene)

