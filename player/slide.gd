extends State


func logic()->void:
	.logic()
	pl.vel.y = 0
	pl.grv = pl.DEFAULT_GRAV /1.2
	pl.apply_dir(dir)
	
	if jump and not pl.next_to_top():
		next_state = _states["invert_jump"]
		
	elif jump and  pl.next_to_top():
		next_state = _states["jump"]
	elif ! pl.is_on_wall():
		next_state = _states["idle"]
	
	elif pl.is_on_floor():
		next_state = _states["idle"]
		
		
	elif dir == 0:
		next_state = _states["idle"]
		

