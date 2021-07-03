extends Node2D
class_name State

var pl:Player
onready var _states:={}
var next_state:State
var jump := false
var down := false
var up   := false
var unjump:= false
var dash := false
var dir  := 0.0

func enter()->void:
	next_state = null
	pl.anim(name)

func logic() ->void:
	get_input()
	if down and pl.check_one_way():
		pl.fall_one_way()
		
	pl.move()
	
func get_transition()->State:
	return next_state
	
func get_input()->void:
	dir =  Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	down = Input.is_action_just_pressed("down")
	up   = Input.is_action_just_pressed("up")
	jump = Input.is_action_just_pressed("ui_accept")
	unjump = Input.is_action_just_released("ui_accept")
	dash = Input.is_action_just_pressed("dash")




