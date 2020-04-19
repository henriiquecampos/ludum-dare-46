extends Node2D

signal mass_depleated

export (float) var mass = 5000.0 setget set_mass
export (float) var loss_per_second = 0.01

var scale_ratio = 1.0

onready var tween = $Tween
onready var shape = $Area2D/CollisionShape2D.shape
onready var sprites = $Sprites
onready var _initial_mass = mass


func _process(delta):
	mass -= (mass * loss_per_second) * delta
	shape.radius -= (shape.radius * loss_per_second) * delta
	sprites.scale -= (sprites.scale * loss_per_second) * delta
	mass = max(0, mass)
	if mass <= 0:
		set_process(false)
		emit_signal("mass_depleated")


func set_mass(new_mass):
	mass = new_mass
	scale_ratio = mass / _initial_mass


func _on_Area2D_absorbed(object_mass):
	self.mass += object_mass


func _on_Tween_tween_completed(object, key):
	shape.radius *= scale_ratio
