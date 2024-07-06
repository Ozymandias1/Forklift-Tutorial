extends VehicleBody3D

@onready var fork = $Mast/Fork

@export var throttle_power = 50

var fork_min_height = -1.125
var fork_max_height = 1.808

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("Steer Left", "Steer Right") * 0.8, 3 * delta)
	engine_force = throttle_power * Input.get_axis("Brake", "Throttle")
	
	if Input.is_action_pressed("Fork Up"):
		fork.position.y += 1.0 * delta
		fork.position.y = clampf(fork.position.y, fork_min_height, fork_max_height)
	if Input.is_action_pressed("Fork Down"):
		fork.position.y -= 1.0 * delta
		fork.position.y = clampf(fork.position.y, fork_min_height, fork_max_height)
