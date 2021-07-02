extends Node2D

func _process(_delta: float) -> void:
	$CanvasLayer/left.modulate.a  = 1.0 if Input.is_action_pressed("ui_left")  else 0.2
	$CanvasLayer/right.modulate.a = 1.0 if  Input.is_action_pressed("ui_right") else 0.2
	$CanvasLayer/jump.modulate.a  = 1.0 if  Input.is_action_pressed("ui_accept") else 0.2
	$CanvasLayer/dash.modulate.a  = 1.0 if  Input.is_action_pressed("dash") else 0.2
