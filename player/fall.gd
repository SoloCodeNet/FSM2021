extends State

func logic()->void:
	.logic()
	pl.calc_physic(dir)
	
	if dir != 0 and dash:
		next_state = _states["dash"]

	if jump and pl.jump_count < 2:
		pl.jump_count +=1
		next_state = _states["double"]
		
	if pl.is_on_wall() and pl.vel.y > 0:
		next_state = _states["slide"]
		
	if pl.is_on_floor():
		next_state = _states["idle"]
		
