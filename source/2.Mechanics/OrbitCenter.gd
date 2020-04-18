extends Position2D


export (PackedScene) var space_object_scene

onready var animator = $Animator

onready var radius = 100
onready var speed = animator.playback_speed

var speeds = [1, 1.3, 1.5, 2.0, 2.3, 2.5, 3, 3.3, 3.5, 4]

func _ready():
	randomize()


func orbit():
	var space_object = space_object_scene.instance()
	add_child(space_object)
	speed = speeds[randi()%speeds.size()]
	radius = rand_range(100, 500)
	
	space_object.position.x = radius
	animator.playback_speed = speed
	animator.play("Spin")
