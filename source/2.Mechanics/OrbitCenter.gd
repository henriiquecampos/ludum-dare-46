extends Position2D


export (PackedScene) var space_object_scene

var space_object = null

onready var animator = $Animator

onready var radius = 100
onready var speed = animator.playback_speed

func _ready():
	randomize()
	orbit()


func orbit():
	space_object = space_object_scene.instance()
	space_object.connect("selected", self, "_on_SpaceObject_selected")
	space_object.connect("tree_exited", self, "_on_SpaceObject_tree_exited")
	add_child(space_object)
	speed = rand_range(0.5, 2.0)
	radius = rand_range(200, 500)
	
	space_object.position.x = radius
	space_object.initial_position = space_object.position
	space_object.offset = space_object.initial_position / space_object.pulls_required
	animator.playback_speed = speed
	animator.play("Spin")

func _on_SpaceObject_tree_exited():
	queue_free()


func _on_SpaceObject_selected(is_selected):
	if is_selected:
		animator.stop(false)
	else:
		animator.play()
	
