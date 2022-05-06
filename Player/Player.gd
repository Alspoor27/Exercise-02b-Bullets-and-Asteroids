extends KinematicBody2D

var velocity = Vector2.ZERO

var rotation_speed = 5.0
var speed = 5.0
var max_speed = 400


onready var Bullet = load("res;//Player/Bullet.tscn")
var nose = Vector2(0,-60)

func _ready():
	pass
func _physics_process(_delta):
	position = position + velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	velocity = move_and_slide(velocity.Vector2.zero)
	position.x =wrapf(position.x,0,1024)
	position.y =wrapf(position.y,0,600)
	
func get_input():
	var to_return = Vector2.ZERO
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		to_return.y -= 1
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rotation_speed
	if Input.is_action_just_pressed("shoot"):
		rotation_degrees = rotation_degrees + rotation_speed
	if Input. is_action_pressed("shoot"):
		var Effects = get_node_or_null("/root/Game/Effcts")
		if Effects !=null:
			var bullet = Bullet.instance()
			bullet.global_position = global_position + nose.rotated(rotation)
			bullet.rotation = rotation
			add_child(bullet)
		
	return to_return.rotated(rotation)
