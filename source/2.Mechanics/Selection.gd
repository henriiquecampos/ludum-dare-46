extends Node

signal selection_changed(new_object)

var current_selection = null setget set_current_selection

func set_current_selection(new_object):
	current_selection = new_object
	emit_signal("selection_changed", current_selection)
