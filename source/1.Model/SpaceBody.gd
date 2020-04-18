extends Node2D

export (int) var pulls_required = 3
export (float) var mass = 100.0

onready var initial_position = position
onready var offset = initial_position / pulls_required

func _process(delta: float) -> void:
	global_rotation_degrees = 0


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		Selection.current_selection = self


func _on_Area2D_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_Area2D_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
