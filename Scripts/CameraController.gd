extends Node3D

@export var follow_target: Node3D

@onready var camera_3d = $Camera3D

func _process(delta):
	if follow_target != null:
		self.global_position = follow_target.global_position
		
func _input(event):
	if event.is_action_pressed("Camera Do Rotate"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_released("Camera Do Rotate"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if event.is_action("Zoom In"):
		camera_3d.position.z -= 0.5
	if event.is_action("Zoom Out"):
		camera_3d.position.z += 0.5
		
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		global_rotate(Vector3.UP, event.relative.x * -0.001)
		global_rotate(camera_3d.global_transform.basis.x, event.relative.y * -0.001)
