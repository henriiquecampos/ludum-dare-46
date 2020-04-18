extends Node2D

export (int) var pulls_required = 3
export (float) var mass = 100.0


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		Selection.current_selection = self
