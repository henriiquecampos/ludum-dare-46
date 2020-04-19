extends Node


var initial_position = Vector2.ZERO
onready var tween = $Tween


func _unhandled_input(event: InputEvent) -> void:
	if event.is_echo():
		return
	if event.is_action_pressed("pull"):
		pull()


func pull():
	if Selection.current_selection == null:
		return
	if tween.is_active():
		tween.stop_all()
	
	var space_object = Selection.current_selection
	
	space_object.pulls_required -= 1
	space_object.pulls_required = max(0, space_object.pulls_required)
	var target_position = Vector2.ZERO + (space_object.offset * space_object.pulls_required)
	
	
	tween.interpolate_property(
		space_object,
		"position",
		space_object.position,
		target_position,
		0.5,
		tween.TRANS_LINEAR,
		tween.EASE_IN
	)
	tween.start()
	
