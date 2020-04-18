extends Position2D


export (PackedScene) var space_object_scene

onready var animator = $Animator

onready var radius = 100
onready var speed = animator.playback_speed

func _ready():
	randomize()
	orbit()


func orbit():
	var space_object = space_object_scene.instance()
	add_child(space_object)
	speed = rand_range(0.5, 2.0)
	radius = rand_range(100, 500)
	
	space_object.position.x = radius
	space_object.initial_position = space_object.position
	space_object.offset = space_object.initial_position / space_object.pulls_required
	animator.playback_speed = speed
	animator.play("Spin")
