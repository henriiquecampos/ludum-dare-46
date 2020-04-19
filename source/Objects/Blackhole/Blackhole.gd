extends Node2D

export (float) var mass = 5000.0 setget set_mass

var scale_ratio = 1.0

onready var tween = $Tween
onready var _initial_mass = mass

func set_mass(new_mass):
	mass = new_mass
	scale_ratio = mass / _initial_mass
	if tween.is_active():
		tween.stop_all()
	tween.interpolate_property(
		$Sprites,
		"scale",
		scale,
		Vector2.ONE * scale_ratio,
		1.0,
		Tween.TRANS_ELASTIC,
		Tween.EASE_IN
	)
	tween.start()


func _on_Area2D_absorbed(object_mass):
	self.mass += object_mass



func _on_Tween_tween_completed(object, key):
	$Area2D/CollisionShape2D.shape.radius *= scale_ratio
