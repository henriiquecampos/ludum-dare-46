extends Node

export(String, FILE, "*.tscn") var game_over_scene


func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_pressed() and event.unicode == KEY_R:
		get_tree().reload_current_scene()


func _on_Blackhole_mass_depleated():
	get_tree().change_scene(game_over_scene)
