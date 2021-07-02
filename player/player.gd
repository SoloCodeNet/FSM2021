extends KinematicBody2D
class_name Player

const DEFAULT_SPEED:= 200.0
const DEFAULT_GRAV:= 1000.0
const DEFAULT_JUMP:= 316.0
const DEFAULT_ACCEL:= 0.15

var spd := DEFAULT_SPEED
var jmp := DEFAULT_JUMP
var grv := DEFAULT_GRAV
var accel:=DEFAULT_ACCEL
var snap := Vector2.DOWN
var vel := Vector2.ZERO
var dir := 0.0
var old_dir:= 0.0
var jump_count:= 0

var is_timed:= false

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_on_floor():jump_count=0
	snap = Vector2.DOWN
	vel.y+= grv * delta
	
func jump(_factor:float = 1.0)->void:
	vel.y = -(jmp * _factor)
	snap = Vector2.ZERO
	
func move() -> void:
	vel = move_and_slide_with_snap(vel, snap, Vector2.UP)
	grv = 0.0 if is_on_floor() else DEFAULT_GRAV
	
func check_top()->bool:
	return $top.is_colliding() or $top2.is_colliding()
	
func check_one_way()->bool:
	return $down.is_colliding() and $down.get_collider().is_in_group("fall")
	
func fall_one_way()->void:
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(0, false)
	yield(get_tree().create_timer(0.3), "timeout")
	set_collision_layer_bit(0, true)
	set_collision_mask_bit(0, true)

func dash(_wait_time:float)->void:
	old_dir = dir
	is_timed = true
	$Timer.start(_wait_time)
	
func next_to_wall()-> bool:
	return next_to_left() or next_to_right()
	
func next_to_left()->bool:
	return $left1.is_colliding() or $left2.is_colliding()

func next_to_right()->bool:
	return $right1.is_colliding() or $right2.is_colliding()
	
func next_to_top()->bool:
	return $right1.is_colliding() and ! $right2.is_colliding() or $left1.is_colliding() and ! $left2.is_colliding()

func stop_dash()->bool:
	return $right1.is_colliding() or $left1.is_colliding() 
func calc_physic(_dir:float) ->void:
	dir = _dir
	vel.x = lerp(vel.x, dir * spd, accel)

func anim(_name:String)->void:
	if dir < 0: $Sprite.flip_h = true
	if dir > 0: $Sprite.flip_h = false
	print(_name)
	if _name != $anim.current_animation:
		$anim.play(_name)

func _on_Timer_timeout() -> void:
	is_timed = false

